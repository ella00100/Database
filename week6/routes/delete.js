import express from 'express';
import { selectLoginSql, deleteLoginSql } from '../database/sql';

const router = express.Router();

router.get('/delete', async (req, res) => {
    if (req.session.user != undefined) {
        const Class = await selectLoginSql.getClass(req.session.user);
        res.render('delete', {
            title: "수강중인 class delete",
            Class,
        });
    } else{
        res.redirect('/');
    }
});

router.post('/delete', async (req, res) => {
    console.log("delete :", req.body.delBtn);
    const data = {
        ClassId: req.body.delBtn,
    };

    await deleteLoginSql.deleteClass(data);

    res.redirect('/class/delete');
});

module.exports = router;
