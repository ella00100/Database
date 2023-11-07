import express from "express";
import { selectLoginSql } from "../database/sql";

const router = express.Router();

router.get('/', (req, res) => {
    res.render('login');
});

router.post('/', async (req, res) => {
    const vars = req.body;
    console.log(req.body);
    console.log(req.session);
    const users = await selectLoginSql.getUser();

    users.map((user) => {
        console.log('Student ID :', user.Sid);
        console.log('Student Phone: ', user.SphoneNumber);
        console.log(' ');
        if (vars.id == user.Sid && vars.password == user.SphoneNumber) {
            console.log('login success!');
            req.session.user = { id: user.Sid, role : 'student', checkLogin: true };
        }
    });


    if (req.session.user == undefined) {
        console.log('login failed!');
        res.send(`<script>
                    alert('login failed!');
                    location.href='/';
                </script>`)
    } else if (req.session.user.checkLogin && req.session.user.role === 'student') {
        res.redirect('/select');
    } else if (req.session.user.checkLogin) {
        res.redirect('/delete');
    }
});

module.exports = router;