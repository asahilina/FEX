%ifdef CONFIG
{
  "HostFeatures": ["AVX"],
  "RegData": {
      "XMM0": ["0xA76C4F06A12BFCE0", "0x9B80767F1E6A060F", "0xFFFFFFFFFFFFFFFF", "0xEEEEEEEEEEEEEEEE"],
      "XMM1": ["0x6868C3F3AAED56E0", "0xF0FCE9E294E6E6DE", "0xDDDDDDDDDDDDDDDD", "0xCCCCCCCCCCCCCCCC"],
      "XMM2": ["0xA76C4F06A12BFCE0", "0xA76C4F06A12BFCE0", "0xA76C4F06A12BFCE0", "0xA76C4F06A12BFCE0"],
      "XMM3": ["0x6868C3F3AAED56E0", "0x6868C3F3AAED56E0", "0x0000000000000000", "0x0000000000000000"],
      "XMM4": ["0xFFFFFFFFFFFFFFFF", "0xFFFFFFFFFFFFFFFF", "0xFFFFFFFFFFFFFFFF", "0xFFFFFFFFFFFFFFFF"],
      "XMM5": ["0xEEEEEEEEEEEEEEEE", "0xEEEEEEEEEEEEEEEE", "0x0000000000000000", "0x0000000000000000"]
  }
}
%endif

lea rdx, [rel .data]

vmovaps ymm0, [rdx + 32 * 0]
vmovaps ymm1, [rdx + 32 * 1]

; Register broadcasting
vpbroadcastq ymm2, xmm0
vpbroadcastq xmm3, xmm1

; Memory broadcasting
vpbroadcastq ymm4, [rdx + 16]
vpbroadcastq xmm5, [rdx + 24]

hlt

align 32
.data:
dq 0xA76C4F06A12BFCE0
dq 0x9B80767F1E6A060F
dq 0xFFFFFFFFFFFFFFFF
dq 0xEEEEEEEEEEEEEEEE

dq 0x6868C3F3AAED56E0
dq 0xF0FCE9E294E6E6DE
dq 0xDDDDDDDDDDDDDDDD
dq 0xCCCCCCCCCCCCCCCC
