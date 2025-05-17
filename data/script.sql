DROP TABLE IF EXISTS eggs;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS mosquitoes;
DROP TABLE IF EXISTS breeding_sites;
DROP TABLE IF EXISTS metrics;
DROP TABLE IF EXISTS cases;

CREATE TABLE people (
    execution_id INT NOT NULL,
    simulation_id INT,
    cycle INT,
    started_from_cycle INT DEFAULT 0,
    name VARCHAR(40),
    id INT,
    date_of_birth DATE,
    objective VARCHAR(20) DEFAULT 'resting',
    speed FLOAT DEFAULT -1.0,
    state INT DEFAULT 0,
    living_place INT DEFAULT -1,
    working_place INT DEFAULT -1,
    start_work_h INT DEFAULT -1,
    end_work_h INT DEFAULT -1,
    x FLOAT DEFAULT -1.0,
    y FLOAT DEFAULT -1.0,
    PRIMARY KEY (execution_id, simulation_id, started_from_cycle, cycle, id)
);

CREATE TABLE mosquitoes (
    execution_id INT NOT NULL,
    simulation_id INT NOT NULL,
    cycle INT,
    started_from_cycle INT DEFAULT 0,
    name VARCHAR(40),
    id INT,
    date_of_birth DATE,
    speed FLOAT DEFAULT -1.0,
    state INT DEFAULT 0,
    curr_building INT DEFAULT -1,
    bs_id INT DEFAULT -1,
    x FLOAT DEFAULT -1.0,
    y FLOAT DEFAULT -1.0,
    PRIMARY KEY (execution_id, simulation_id, started_from_cycle, cycle, id)
);

CREATE TABLE breeding_sites (
    execution_id INT NOT NULL,
    simulation_id INT NOT NULL,
    cycle INT,
    started_from_cycle INT DEFAULT 0,
    name VARCHAR(40),
    id INT,
    date_of_birth DATE,
    active BOOLEAN DEFAULT TRUE,
    eggs INT DEFAULT -1,
    curr_building INT DEFAULT -1,
    x FLOAT DEFAULT -1.0,
    y FLOAT DEFAULT -1.0,
    PRIMARY KEY (execution_id, simulation_id, started_from_cycle, cycle, id)
);

CREATE TABLE eggs (
    execution_id INT NOT NULL,
    simulation_id INT NOT NULL,
    cycle INT,
    started_from_cycle INT DEFAULT 0,
    oviposition_date DATE,
    breeding_site INT,
    deposited_days INT
);

CREATE TABLE metrics (
    execution_id INT NOT NULL,
    simulation_id INT NOT NULL,
    cycle INT,
    started_from_cycle INT DEFAULT 0,
    event_date DATE,
    specie VARCHAR(30),
    susceptible INT DEFAULT 0,
    exposed INT DEFAULT 0,
    infected INT DEFAULT 0,
    recovered INT DEFAULT 0,
    dead INT DEFAULT 0,
    PRIMARY KEY (execution_id, simulation_id, started_from_cycle, cycle, event_date)
);

CREATE TABLE metrics_infected_people (
	execution_id INT NOT NULL,
	simulation_id INT NOT NULL,
    cycle INT,
	id INT NOT NULL,
	event_date DATE NOT NULL,
	living_place INT NOT NULL
);

CREATE TABLE cases (
    city varchar,
    data_notification DATE,
    data_first_symptoms DATE,
    classification int,
    x FLOAT,
    y FLOAT
);

-- SELECT pg_terminate_backend(pid)
-- FROM pg_stat_activity
-- WHERE pid <> pg_backend_pid()
--   AND datname = 'dengue-propagation'
--   AND state = 'idle';

-- COPY cases FROM '/tmp/sinan_cases.csv' WITH (FORMAT csv, HEADER true);