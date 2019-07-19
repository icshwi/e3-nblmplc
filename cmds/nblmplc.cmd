require nblmplc, master

# PLC communication
require s7plc,1.4.0p
require modbus,2.11.0p

## -- S7PLC --
# add communications IOC (S7PLC + modbus)
#s7plcConfigure("plcName",     "ip",          port, inByte, outByte, bigEndian, recTimeout, sendIntervall)
s7plcConfigure("ESS_NBLM_PLC","10.2.176.36",2000,534,0,1,500,100)
# var s7plcDebug 0
## -- S7PLC --

## -- MODBUS --

## -- first tests (working)
# #drvAsynIPPortConfigure( portName,          hostInfo,           priority, noAutoConnect, noProcessEos)
# # drvAsynIPPortConfigure("PLC01502",        "10.2.176.36:502",  0,        1,             1)
# # ?? 
# drvAsynIPPortConfigure("PLC01503", "10.2.176.36:503", 0, 1, 1)

# # modbusInterposeConfig(portName,          linkType, timeoutMsec, writeDelayMsec)
# # modbusInterposeConfig("PLC01502",        0,        1000,        0)
# modbusInterposeConfig(  "ESS_NBLM_PLC502", 0,        1000,        0)
# # ?
# modbusInterposeConfig(  "PLC01503",        0,        1000,        0)

# # drvModbusAsynConfigure(portName,              tcpPortName, slaveAddress, modbusFunction, modbusStartAddress, modbusLength, dataType, pollMsec, plcType
# drvModbusAsynConfigure(  "PLC01503_AS_WRITE_0", "PLC01503",  1,            16,             0,	               6,            4,        0,        "SIEMENS")
# drvModbusAsynConfigure(  "PLC01502_AS_WRITE_0", "PLC01502",  1,            16,             0,	               45,           8,        0,        "SIEMENS")
# drvModbusAsynConfigure(  "PLC01_TS_WRITE_4000", "PLC01502",  1,            5,              4000,               40,           0,        0,        "SIEMENS")
## -- first tests (working)



# Protocol configuration generated by PLCParserTool version 2.2.1 the 10-04-2019 15:12:45
#=======================================================
#-----------------------------------------------------------------
# Configure serial or TCP connections
#
# Modbus/TCP example
#
#drvAsynIPPortConfigure(portName, hostInfo, priority, noAutoConnect, noProcessEos)
#noAutoConnect flag is set to 0 so that asynManager will do normal automatic connection management
#noProcessEos flag is set to 1 because Modbus over TCP does not require end-of-string processing

drvAsynIPPortConfigure("ESS_NBLM_PLC509",		"10.2.176.36:509",0,0,1)
drvAsynIPPortConfigure("ESS_NBLM_PLC502",		"10.2.176.36:502",0,0,1)
drvAsynIPPortConfigure("ESS_NBLM_PLC503",		"10.2.176.36:503",0,0,1)
drvAsynIPPortConfigure("ESS_NBLM_PLC504",		"10.2.176.36:504",0,0,1)
drvAsynIPPortConfigure("ESS_NBLM_PLC505",		"10.2.176.36:505",0,0,1)
drvAsynIPPortConfigure("ESS_NBLM_PLC506",		"10.2.176.36:506",0,0,1)
drvAsynIPPortConfigure("ESS_NBLM_PLC507",		"10.2.176.36:507",0,0,1)
drvAsynIPPortConfigure("ESS_NBLM_PLC508",		"10.2.176.36:508",0,0,1)

# modbusInterposeConfig(portName, linkType, timeoutMsec, writeDelayMsec)
# linkType: 0 = TCP/IP, 1 = RTU, 2 = ASCII
# timeoutMsec: The timeout in milliseconds for write and read
# writeDelayMsec: delay in milliseconds before each write from EPICS to the device (only needed for Serial RTU devices, default is 0)

modbusInterposeConfig("ESS_NBLM_PLC509",0,1000,0)
modbusInterposeConfig("ESS_NBLM_PLC502",0,1000,0)
modbusInterposeConfig("ESS_NBLM_PLC503",0,1000,0)
modbusInterposeConfig("ESS_NBLM_PLC504",0,1000,0)
modbusInterposeConfig("ESS_NBLM_PLC505",0,1000,0)
modbusInterposeConfig("ESS_NBLM_PLC506",0,1000,0)
modbusInterposeConfig("ESS_NBLM_PLC507",0,1000,0)
modbusInterposeConfig("ESS_NBLM_PLC508",0,1000,0)

# Modbus port configuration
# drvModbusAsynConfigure(portName, tcpPortName, slaveAddress, modbusFunction, modbusStartAddress,modbusLength,dataType,pollMsec, plcType
# modbusLength : length in bits for TE (max 2000) and TS (max 1968) and in bytes for AE (max 125) and AS (max 123)
# modbusFunction = 1 : Read Coils (read TS)
# modbusFunction = 2 : Read Discrete Inputs (read TE)
# modbusFunction = 3 : Read Multiple Registers (2 bytes = one word) (read AS)
# modbusFunction = 4 : Read Input Registers (2 bytes = one word) (read AE)
# modbusDataType = 0: UINT16 Unsigned 16-bit binary integers; 7 = FLOAT32_LE ; 8 = FLOAT32_BE : 32-bit floating point
# TYPE_BE Big Endian (most significant word at Modbus address N, least significant word at Modbus address N+1)
# TYPE_LE Little Endian
# pollMsec: period delay in millisecond of the request
# plcType : This parameter is currently used to print information in asynReport.
#
#					portName,	tcpPortName,	slaveAddr,	modbusFct,	addr,	length,	dataType,	pollMsec,	plcType

# modbusFunction = 5 : Write Single Coil (write TS)
# modbusFunction = 16 : Write Multiple Holding Registers (2 bytes = one word) (write AS)
# pollMsec: For write functions, a non-zero value means that the Modbus data should be read once when the port driver is first created.
#
#					    portName,	                        tcpPortName,	        slaveAddr,	modbusFct,	addr,	length,	dataType,	pollMsec,	plcType,
drvModbusAsynConfigure("ESS_NBLM_PLC502_AS_WRITE_0",		"ESS_NBLM_PLC502",		1,			16,			0,		40,		8,			1,			"SIEMENS")
drvModbusAsynConfigure("ESS_NBLM_PLC508_AS_WRITE_0",		"ESS_NBLM_PLC508",		1,			16,			0,		6,		4,			1,			"SIEMENS")
drvModbusAsynConfigure("ESS_NBLM_PLC509_AS_WRITE_0",		"ESS_NBLM_PLC509",		1,			16,			0,		2,		8,			1,			"SIEMENS")
drvModbusAsynConfigure("ESS_NBLM_PLC503_AS_WRITE_0",		"ESS_NBLM_PLC503",		1,			16,			0,		40,		8,			1,			"SIEMENS")
drvModbusAsynConfigure("ESS_NBLM_PLC504_AS_WRITE_0",		"ESS_NBLM_PLC504",		1,			16,			0,		40,		8,			1,			"SIEMENS")
drvModbusAsynConfigure("ESS_NBLM_PLC507_AS_WRITE_0",		"ESS_NBLM_PLC507",		1,			16,			0,		40,		8,			1,			"SIEMENS")
drvModbusAsynConfigure("ESS_NBLM_PLC505_AS_WRITE_0",		"ESS_NBLM_PLC505",		1,			16,			0,		40,		8,			1,			"SIEMENS")
drvModbusAsynConfigure("ESS_NBLM_PLC506_AS_WRITE_0",		"ESS_NBLM_PLC506",		1,			16,			0,		40,		8,			1,			"SIEMENS")
drvModbusAsynConfigure("ESS_NBLM_PLC502_TS_WRITE_4000",		"ESS_NBLM_PLC502",		1,			5,			4000,	1640,	0,			1,			"SIEMENS")
drvModbusAsynConfigure("ESS_NBLM_PLC502_TS_WRITE_6400",		"ESS_NBLM_PLC502",		1,			5,			6400,	1640,	0,			1,			"SIEMENS")
drvModbusAsynConfigure("ESS_NBLM_PLC502_TS_WRITE_8800",		"ESS_NBLM_PLC502",		1,			5,			8800,	3,		0,			1,			"SIEMENS")

#=======================================================

#=======================================================
    
# load database
dbLoadRecords("iocEss_nblm.db") 


