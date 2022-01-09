ALTER TABLE popravlja
    ADD CONSTRAINT popravlja_pk PRIMARY KEY ( domar_id_radnik,
                                              prijavljuje_id_soba,
                                              prijavljuje_jmbg,
                                              prijavljuje_id_kvar );