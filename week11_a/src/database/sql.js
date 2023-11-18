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
  // <td>{{ID}}</td>
  // <td>{{Course}}</td>
  // <td>{{Professor}}</td>
  // <td>{{Opening_departments}}</td>
  // <td>{{Number_of_participant}}</td>
  getEnrolledCourse: async (data) => {
    const uid = await promisePool.query(`select Id from Student where StudentId=${data.sId}`);
    console.log(uid[0][0].Id);
    const [rows] = await promisePool.query(`
    select C.ID, C.Name as Course, C.Professor, D.Dname as Opening_departments, C.Number_of_participant
    from class C
    join department D on C.Did = D.Id
    left join class_student CS on C.ID = CS.Class_Id
    where CS.Student_Id = '${uid[0][0].Id}' and C.Did = D.Id`);
    return rows;
  },
  // <td>{{ID}}</td>
  //             <td>{{Course}}</td>
  //             <td>{{Professor}}</td>
  //             <td>{{Opening_departments}}</td>
  //             <td>{{Number_of_participant}}</td>
  //             <td id="empty">{{Remaining_participants}}</td>
  getAllCourse: async() => {
    const [rows] = await promisePool.query(`
    select C.ID, C.Name as Course, C.Professor, 
    D.Dname as Opening_departments,
    C.Number_of_participant,
    Number_of_participant - COUNT(CS.Student_Id) as Remaining_participants
    from Class C 
    join department D on C.Did = D.Id
    left join class_student CS 
    on C.ID= CS.Class_Id 
    group by C.ID; `)
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
