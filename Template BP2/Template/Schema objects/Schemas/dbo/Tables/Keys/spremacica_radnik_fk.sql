ALTER TABLE spremacica
    ADD CONSTRAINT spremacica_radnik_fk FOREIGN KEY ( id_radnik )
        REFERENCES radnik ( id_radnik );
