%ifdef CONFIG
{
  "HostFeatures": ["AVX"],
  "RegData": {
    "XMM0":  ["0x3F8000003F800000", "0x3F8000003F800000", "0x0000000000000000", "0x0000000000000000"],
    "XMM1":  ["0x4080000040000000", "0x4080000040800000", "0x0000000000000000", "0x0000000000000000"],
    "XMM2":  ["0x4110000040400000", "0x4110000041100000", "0x0000000000000000", "0x0000000000000000"],
    "XMM3":  ["0x4180000040800000", "0x4180000041800000", "0x0000000000000000", "0x0000000000000000"],
    "XMM4":  ["0x41C800003F800000", "0x41C8000041C80000", "0x0000000000000000", "0x0000000000000000"],
    "XMM5":  ["0x4080000040000000", "0x4080000040800000", "0x0000000000000000", "0x0000000000000000"],
    "XMM6":  ["0x4110000040400000", "0x4110000041100000", "0x0000000000000000", "0x0000000000000000"],
    "XMM7":  ["0x4180000040800000", "0x4180000041800000", "0x0000000000000000", "0x0000000000000000"],
    "XMM8":  ["0x418000003F800000", "0x4180000041800000", "0x0000000000000000", "0x0000000000000000"],
    "XMM9":  ["0x41C8000040000000", "0x41C8000041C80000", "0x0000000000000000", "0x0000000000000000"],
    "XMM10": ["0x4080000040400000", "0x4080000040800000", "0x0000000000000000", "0x0000000000000000"],
    "XMM11": ["0x4110000040800000", "0x4110000041100000", "0x0000000000000000", "0x0000000000000000"]
  },
  "MemoryRegions": {
    "0x100000000": "4096"
  }
}
%endif

lea rdx, [rel .data]

vmovapd ymm0, [rdx + 32 * 0]
vmovapd ymm1, [rdx + 32 * 1]
vmovapd ymm2, [rdx + 32 * 2]
vmovapd ymm3, [rdx + 32 * 3]
vmovapd ymm4, [rdx + 32 * 4]
vmovapd ymm5, [rdx + 32 * 1]
vmovapd ymm6, [rdx + 32 * 2]
vmovapd ymm7, [rdx + 32 * 3]

; Register only
vsqrtss xmm0, xmm0, xmm0
vsqrtss xmm1, xmm1, xmm1
vsqrtss xmm2, xmm2, xmm2
vsqrtss xmm3, xmm3, xmm3

; Memory operand
vsqrtss xmm4, xmm4, [rdx + 32 * 0]
vsqrtss xmm5, xmm5, [rdx + 32 * 1]
vsqrtss xmm6, xmm6, [rdx + 32 * 2]
vsqrtss xmm7, xmm7, [rdx + 32 * 3]

; Merge different source register
vsqrtss xmm8, xmm3, [rdx + 32 * 0]
vsqrtss xmm9, xmm4, [rdx + 32 * 1]
vsqrtss xmm10, xmm5, [rdx + 32 * 2]
vsqrtss xmm11, xmm6, [rdx + 32 * 3]

hlt

align 32
.data:
dq 0x3F8000003F800000 ; 1.0
dq 0x3F8000003F800000
dq 0x3F8000003F800000
dq 0x3F8000003F800000

dq 0x4080000040800000 ; 4.0
dq 0x4080000040800000
dq 0x4080000040800000
dq 0x4080000040800000

dq 0x4110000041100000 ; 9.0
dq 0x4110000041100000
dq 0x4110000041100000
dq 0x4110000041100000

dq 0x4180000041800000 ; 16.0
dq 0x4180000041800000
dq 0x4180000041800000
dq 0x4180000041800000

dq 0x41C8000041C80000 ; 25.0
dq 0x41C8000041C80000
dq 0x41C8000041C80000
dq 0x41C8000041C80000
