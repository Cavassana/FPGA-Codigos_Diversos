LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.all;

ENTITY contadorTesteUnidade IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		cnt_en		: IN STD_LOGIC ;
		data		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		sclr		: IN STD_LOGIC ;
		sload		: IN STD_LOGIC ;
		sset		: IN STD_LOGIC ;
		updown		: IN STD_LOGIC ;
		cout		: OUT STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
	);
END contadorTesteUnidade;


ARCHITECTURE SYN OF contadorTesteUnidade IS

	SIGNAL sub_wire0	: STD_LOGIC ;
	SIGNAL sub_wire1	: STD_LOGIC_VECTOR (3 DOWNTO 0);

	COMPONENT lpm_counter
GENERIC (	lpm_direction	: STRING;
			lpm_modulus		: NATURAL;
			lpm_port_updown	: STRING;
			lpm_type		: STRING;
			lpm_width		: NATURAL);
	PORT (	clock		: IN STD_LOGIC ;
			sclr		: IN STD_LOGIC ;
			cnt_en		: IN STD_LOGIC ;
			cout		: OUT STD_LOGIC ;
			q			: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
			sload		: IN STD_LOGIC ;
			sset		: IN STD_LOGIC ;
			updown		: IN STD_LOGIC ;
			data		: IN STD_LOGIC_VECTOR (3 DOWNTO 0));
	END COMPONENT;

BEGIN
	cout <= sub_wire0;
	q    <= sub_wire1(3 DOWNTO 0);

	LPM_COUNTER_component : LPM_COUNTER
GENERIC MAP (	lpm_direction => "UNUSED",
				lpm_modulus => 13,
				lpm_port_updown => "PORT_USED",
				lpm_type => "LPM_COUNTER",
				lpm_width => 4)
	PORT MAP (	clock => clock,
				sclr => sclr,
				cnt_en => cnt_en,
				sload => sload,
				sset => sset,
				updown => updown,
				data => data,
				cout => sub_wire0,
				q => sub_wire1);

END SYN;