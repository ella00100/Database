import express from "express";
// TODO
// sql import
import { selectSql } from "../database/sql";
import { createSql } from "../database/sql";

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
    const enrolledCourses = await selectSql.getEnrolledCourse({ sId: req.cookies.user });
    //getEnrolledCourse query에서 sid확인하므로 cid만 확인
    const isEnrolled = enrolledCourses.some(course => course.ID == data.cId);
    
    const allCourses = await selectSql.getAllCourse();
    //allCourse에서 Apply클릭된 수업 찾음
    const selectedCourse = allCourses.find(course => course.ID == data.cId);
    
    console.log(req.body);
    console.log(selectedCourse);

    if (isEnrolled) {
        res.send(`<script>
        alert('이미 수강신청이 완료된 과목입니다.');
        location.href='/sugang';
    </script>`);

    } else if (selectedCourse.Remaining_participants == 0) {
        res.send(`<script>
        alert('여석이 남아있지 않습니다.');
        location.href='/sugang';
    </script>`);
    } else {
        await createSql.addClass(data);
        res.redirect('/sugang');
    }
    
});



module.exports = router;