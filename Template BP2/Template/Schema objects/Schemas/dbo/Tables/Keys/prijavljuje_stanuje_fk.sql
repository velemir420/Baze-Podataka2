ALTER TABLE prijavljuje
    ADD CONSTRAINT prijavljuje_stanuje_fk FOREIGN KEY ( stanuje_soba_id_soba,
                                                        stanuje_student_jmbg )
        REFERENCES stanuje ( soba_id_soba,
                             student_jmbg );
