int cvi_board_init(void)
{
	// Camera
	PINMUX_CONFIG(PAD_MIPI_TXM1, IIC2_SDA);    // GP10
	PINMUX_CONFIG(PAD_MIPI_TXP1, IIC2_SCL);    // GP11
	PINMUX_CONFIG(PAD_MIPI_TXP0, CAM_MCLK0);   // Sensor MCLK
	PINMUX_CONFIG(PAD_MIPI_TXP2, XGPIOC_17);   // Sensor RESET

	// UART1
	PINMUX_CONFIG(IIC0_SCL, UART1_TX);         // GP0
	PINMUX_CONFIG(IIC0_SDA, UART1_RX);         // GP1

	// PWM
	PINMUX_CONFIG(JTAG_CPU_TMS, PWM_7);        // GP2
	PINMUX_CONFIG(JTAG_CPU_TCK, PWM_6);        // GP3

	// I2C1
	PINMUX_CONFIG(SD1_D2, IIC1_SCL);           // GP4
	PINMUX_CONFIG(SD1_D1, IIC1_SDA);           // GP5

	// SPI2
	PINMUX_CONFIG(SD1_CLK, SPI2_SCK);          // GP6
	PINMUX_CONFIG(SD1_CMD, SPI2_SDO);          // GP7
	PINMUX_CONFIG(SD1_D0, SPI2_SDI);           // GP8
	PINMUX_CONFIG(SD1_D3, SPI2_CS_X);          // GP9

	// All default GPIOs
	PINMUX_CONFIG(SD0_PWR_EN, XGPIOA_14);      // GP14
	PINMUX_CONFIG(SPK_EN, XGPIOA_15);          // GP15
	PINMUX_CONFIG(EMMC_CMD, XGPIOA_23);        // GP16
	PINMUX_CONFIG(EMMC_DAT1, XGPIOA_24);       // GP17
	PINMUX_CONFIG(EMMC_CLK, XGPIOA_22);        // GP18
	PINMUX_CONFIG(EMMC_DAT0, XGPIOA_25);       // GP19
	PINMUX_CONFIG(EMMC_DAT3, XGPIOA_27);       // GP20
	PINMUX_CONFIG(EMMC_DAT2, XGPIOA_26);       // GP21
	PINMUX_CONFIG(PWR_SEQ2, PWR_GPIO_4);       // GP22

	// LED
	PINMUX_CONFIG(PWR_GPIO2, PWR_GPIO_2);      // GP25

	// ADC pins set to GPIO
	PINMUX_CONFIG(ADC1, XGPIOB_3);             // GP26 (ADC1)
	PINMUX_CONFIG(USB_VBUS_DET, XGPIOB_6);     // GP27 (ADC2)

	return 0;
}