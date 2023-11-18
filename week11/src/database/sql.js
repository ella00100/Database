import mysql from "mysql2";

const pool = mysql.createPool(
  process.env.JAWSDB_URL ?? {
    host: 'localhost',
    user: 'root',
    database: 'WEEK11_INHA_DB',
    password: 'gging00100!',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
  }
);

// async / await 사용
const promisePool = pool.promise();

// selec query
export const selectSql = {
  getUsers: async () => {
    const [rows] = await promisePool.query(`select * from student`);
    return rows;
  },
  getEnrolledCourse: async(data)=>{
    const uid = await promisePool.query(`select Id from Student where StudentId=${data.sId}`);
    console.log(uid);
    const [rows] = await promisePool.query(`
    select C.Cid, C.Name, C.Professor, C.Number_of_participant
    from class C
    left join class_student 
    on C.ID = class_student.Class_Id
    where class_student.Student_Id = ${data.sId}`);
    return rows;
  },
  getAllCourse: async() => {
    const [rows] = await promisePool.query(`
    select C.cid, C.name, C.professor, 
    C.number_of_participant - COUNT(CS.Student_Id) AS Opening_Departments_Maximum_participants 
    from Class C 
    left join class_student CS 
    on C.id= CS.class_id 
    group by C.Id; `)
    return rows;
  }
}

export const createSql = {
  addClass: async (data) => {
    const uid = await promisePool.query(`select Id from Student where StudentId=${data.sId}`);
    console.log(uid);
    const results = await promisePool.query (
      `insert into class_student values (${uid[0][0].Id}, ${data.cId});`
    )
    return results[0];
  }
}
