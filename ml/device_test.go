package ml

import "testing"

func TestDeviceInfoIsROCmGFX900(t *testing.T) {
	t.Parallel()

	tests := []struct {
		name string
		dev  DeviceInfo
		want bool
	}{
		{
			name: "rocm gfx900",
			dev: DeviceInfo{
				DeviceID:     DeviceID{Library: "ROCm"},
				ComputeMajor: 0x9,
				ComputeMinor: 0x00,
			},
			want: true,
		},
		{
			name: "rocm non-gfx900",
			dev: DeviceInfo{
				DeviceID:     DeviceID{Library: "ROCm"},
				ComputeMajor: 0x9,
				ComputeMinor: 0x0a,
			},
			want: false,
		},
		{
			name: "non-rocm",
			dev: DeviceInfo{
				DeviceID:     DeviceID{Library: "CUDA"},
				ComputeMajor: 8,
				ComputeMinor: 0,
			},
			want: false,
		},
	}

	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			if got := tt.dev.IsROCmGFX900(); got != tt.want {
				t.Fatalf("IsROCmGFX900() = %v, want %v", got, tt.want)
			}
		})
	}
}

func TestFlashAttentionSupported(t *testing.T) {
	t.Parallel()

	tests := []struct {
		name    string
		devices []DeviceInfo
		want    bool
	}{
		{
			name: "rocm gfx900 disabled",
			devices: []DeviceInfo{
				{DeviceID: DeviceID{Library: "ROCm"}, ComputeMajor: 0x9, ComputeMinor: 0x00},
			},
			want: false,
		},
		{
			name: "rocm gfx90a supported",
			devices: []DeviceInfo{
				{DeviceID: DeviceID{Library: "ROCm"}, ComputeMajor: 0x9, ComputeMinor: 0x0a},
			},
			want: true,
		},
		{
			name: "cuda sm80 supported",
			devices: []DeviceInfo{
				{DeviceID: DeviceID{Library: "CUDA"}, DriverMajor: 12, ComputeMajor: 8, ComputeMinor: 0},
			},
			want: true,
		},
		{
			name: "cuda sm72 unsupported",
			devices: []DeviceInfo{
				{DeviceID: DeviceID{Library: "CUDA"}, DriverMajor: 12, ComputeMajor: 7, ComputeMinor: 2},
			},
			want: false,
		},
		{
			name: "mixed list fails if one is unsupported",
			devices: []DeviceInfo{
				{DeviceID: DeviceID{Library: "cpu"}},
				{DeviceID: DeviceID{Library: "ROCm"}, ComputeMajor: 0x9, ComputeMinor: 0x00},
			},
			want: false,
		},
	}

	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			if got := FlashAttentionSupported(tt.devices); got != tt.want {
				t.Fatalf("FlashAttentionSupported() = %v, want %v", got, tt.want)
			}
		})
	}
}
