ALTER TABLE stanuje
    ADD CONSTRAINT stanuje_soba_fk FOREIGN KEY ( soba_id_soba )
        REFERENCES soba ( id_soba );
