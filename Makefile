SRC := $(shell pwd)

obj-m += xilinx-isppipeline.o
##CFLAGS_xilinx-isppipeline.o += -I/usr/src/linux-xilinx-zynqmp-headers-5.15.0-1003/include/

EXTRA_CFLAGS += -I$(KERNEL_SRC)/include/linux
EXTRA_CFLAGS += -I$(KERNEL_SRC)/arch/arm64/include/
EXTRA_CFLAGS += -I$(KERNEL_SRC)/arch/arm64/include/generated/
EXTRA_CFLAGS += -I$(KERNEL_SRC)/arch/arm64/include/generated/uapi/
EXTRA_CFLAGS += -I$(KERNEL_SRC)/arch/arm64/include/uapi/

all:
	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) modules

modules_install:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install

clean:
	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) clean
