ALTER TABLE popravlja
    ADD CONSTRAINT popravlja_prijavljuje_fk FOREIGN KEY ( prijavljuje_id_soba,
                                                          prijavljuje_jmbg,
                                                          prijavljuje_id_kvar )
        REFERENCES prijavljuje ( stanuje_soba_id_soba,
                                 stanuje_student_jmbg,
                                 kvar_id_kvar );