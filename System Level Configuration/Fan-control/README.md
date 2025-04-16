# Fan Configuration README

```
sudo pwmconfig
```

## System Information

- **Temperature Sensors:**
  - **hwmon0**: acpitz
  - **hwmon1**: nvme
  - **hwmon2**: amdgpu
  - **hwmon3**: it8686 (fan controller)
  - **hwmon4**: k10temp
  - **hwmon5**: gigabyte_wmi

## Current Temperature Readings

| Sensor             | Temp (°C) |
|--------------------|-----------|
| hwmon0/temp1_input | 16        |
| hwmon0/temp2_input | 16        |
| hwmon1/temp1_input | 33        |
| hwmon1/temp2_input | 33        |
| hwmon2/temp1_input | 37        |
| hwmon3/temp1_input | 33        |
| hwmon3/temp2_input | 49        |
| hwmon3/temp3_input | 42        |
| hwmon3/temp4_input | 17        |
| hwmon3/temp5_input | 46        |
| hwmon3/temp6_input | 47        |
| hwmon4/temp1_input | 42        |
| hwmon5/temp1_input | 33        |
| hwmon5/temp2_input | 49        |
| hwmon5/temp3_input | 42        |
| hwmon5/temp4_input | 17        |
| hwmon5/temp5_input | 46        |
| hwmon5/temp6_input | 47        |

## Fan Configuration

### Fan Outputs

1. **Fan 1 Configuration (hwmon3/pwm1)**
   - **Temperature Source**: hwmon2/temp1_input (amdgpu)
   - **Low Temperature**: 25°C
   - **High Temperature**: 79°C
   - **PWM Value for High Temp**: 255

2. **Fan 2 Configuration (hwmon3/pwm4)**
   - **Temperature Source**: hwmon4/temp1_input (k10temp)
   - **Low Temperature**: 25°C
   - **High Temperature**: 79°C
   - **PWM Value for High Temp**: 255

### Fan Speeds

- **Fan 1**: Current speed is 2122 RPM
- **Fan 2**: Current speed is 0 RPM (check connection)

## Saving Configuration

- Ensure to save the configuration changes to apply them on reboot.

## Testing the Setup

- Use the `sensors` command to monitor fan speeds and temperatures.

## Notes

- Ensure that both fans are correctly connected to the motherboard.
- Monitor system temperatures to ensure effective cooling.

For any questions or issues, please consult the relevant documentation or reach out for assistance.
