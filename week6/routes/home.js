import express from 'express';
import { insertSql } from '../database/sql';

const router = express.Router();

router.get('/', (req, res) => {
    res.render('home', { data: " " });
})

router.post('/insert', (req, res) => {
    const vars = req.body;

    const data = {
        Id: vars.id,
        Major: vars.major,
        Club: vars.club,
        Name: vars.name,
        Email: vars.email,
        PhoneNumber: vars.phoneNumber,
        
    };
    insertSql.setStudent(data);
})

module.exports = router;
