LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.all;

ENTITY contaUnidade_PM IS
	PORT
	(
		cin		: IN STD_LOGIC ;
		clock		: IN STD_LOGIC ;
		data		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		sclr		: IN STD_LOGIC ;
		sload		: IN STD_LOGIC ;
		updown		: IN STD_LOGIC ;
		cout		: OUT STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
	);
END contaUnidade_PM;


ARCHITECTURE SYN OF contaunidade_pm IS

	SIGNAL sub_wire0	: STD_LOGIC ;
	SIGNAL sub_wire1	: STD_LOGIC_VECTOR (4 DOWNTO 0);



	COMPONENT lpm_counter
	GENERIC (
		lpm_direction		: STRING;
		lpm_modulus		: NATURAL;
		lpm_port_updown		: STRING;
		lpm_type		: STRING;
		lpm_width		: NATURAL
	);
	PORT (
			cin	: IN STD_LOGIC ;
			clock	: IN STD_LOGIC ;
			data	: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
			sclr	: IN STD_LOGIC ;
			cout	: OUT STD_LOGIC ;
			q	: OUT STD_LOGIC_VECTOR (4 DOWNTO 0);
			sload	: IN STD_LOGIC ;
			updown	: IN STD_LOGIC 
	);
	END COMPONENT;

BEGIN
	cout    <= sub_wire0;
	q    <= sub_wire1(4 DOWNTO 0);

	LPM_COUNTER_component : LPM_COUNTER
	GENERIC MAP (
		lpm_direction => "UNUSED",
		lpm_modulus => modo,
		lpm_port_updown => "PORT_USED",
		lpm_type => "LPM_COUNTER",
		lpm_width => 5
	)
	PORT MAP (
		cin => cin,
		clock => clock,
		data => data,
		sclr => sclr,
		sload => sload,
		updown => updown,
		cout => sub_wire0,
		q => sub_wire1
	);



END SYN;