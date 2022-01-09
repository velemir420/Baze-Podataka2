ALTER TABLE sprema
    ADD CONSTRAINT sprema_spremacica_fk FOREIGN KEY ( spremacica_id_radnik )
        REFERENCES spremacica ( id_radnik );