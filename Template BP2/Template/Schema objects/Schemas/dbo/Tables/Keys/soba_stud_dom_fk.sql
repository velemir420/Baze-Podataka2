ALTER TABLE soba
    ADD CONSTRAINT soba_stud_dom_fk FOREIGN KEY ( stud_dom_id_stud_dom )
        REFERENCES stud_dom ( id_stud_dom );