ALTER TABLE domar
    ADD CONSTRAINT domar_radnik_fk FOREIGN KEY ( id_radnik )
        REFERENCES radnik ( id_radnik );