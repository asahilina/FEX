
# Careful. Globbing can't see changes to the contents of files
# Need to do a fresh clean to see changes
file(GLOB_RECURSE POSIX_TESTS CONFIGURE_DEPENDS ${CMAKE_SOURCE_DIR}/External/fex-posixtest-bins/conformance/*.test)

foreach(POSIX_TEST ${POSIX_TESTS})

  string(REPLACE "/fex-posixtest-bins/" ";" TEST_NAME_LIST ${POSIX_TEST})
  list(GET TEST_NAME_LIST 1 TEST_NAME)
  string(REPLACE "/" "-" TEST_NAME ${TEST_NAME})

  add_test(NAME "${TEST_NAME}.jit.posix"
    COMMAND "python3" "${CMAKE_SOURCE_DIR}/Scripts/guest_test_runner.py"
    "${CMAKE_CURRENT_SOURCE_DIR}/Known_Failures"
    "${CMAKE_CURRENT_SOURCE_DIR}/Expected_Output"
    "${CMAKE_CURRENT_SOURCE_DIR}/Disabled_Tests"
    "${CMAKE_CURRENT_SOURCE_DIR}/Flake_Tests"
    "${TEST_NAME}"
    "guest"
    "${CMAKE_BINARY_DIR}/Bin/FEXLoader"
    "-o" "stderr" "--no-silent" "-c" "irjit" "-n" "500" "--"
    "${POSIX_TEST}")

endforeach()

add_custom_target(
  posix_tests
  WORKING_DIRECTORY "${CMAKE_BINARY_DIR}"
  USES_TERMINAL
  COMMAND "ctest" "--output-on-failure" "--timeout" "302" ${TEST_JOB_FLAG} "-R" "\.*.posix")
