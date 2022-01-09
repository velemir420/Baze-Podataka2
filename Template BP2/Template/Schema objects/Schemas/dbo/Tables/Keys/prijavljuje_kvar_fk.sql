ALTER TABLE prijavljuje
    ADD CONSTRAINT prijavljuje_kvar_fk FOREIGN KEY ( kvar_id_kvar )
        REFERENCES kvar ( id_kvar );