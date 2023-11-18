import express from "express";
// TODO
// sql import
import { selectSql } from "../database/sql";

const router = express.Router();

router.get('/', async function (req, res) {
    // TODO
    
    if (req.cookies.user) {
        const enrolledCourses = await selectSql.getEnrolledCourse({ sId: req.cookies.user });
        const allCourses = await selectSql.getAllCourse();

        res.render('select', {
            user: req.cookies.user,
            title: "Course completion list",
            classes: enrolledCourses,
            title2: "Course Lisg (Registration)",
            allClass: allCourses
        });
    } else {
        res.render('/');
    }

});

router.post('/', async(req, res) => {
    // TODO
    const data = {
        cId: req.body.applyBtn,
        sId: req.cookies.user,
    };
});

module.exports = router;