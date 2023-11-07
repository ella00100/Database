import mysql from 'mysql2';

require("dotenv").config();

const pool = mysql.createPool({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'gging00100!',
    database: 'inha',
});

const promisePool = pool.promise();

// select query
export const selectSql = {
    getBuilding: async () => {
        const sql = `select * from building`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getDepartment: async () => {
        const sql = `select * from department`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getRoom: async () => {
        const sql = `select * from room`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getStudent: async () => {
        const sql = `select * from Student`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getClass: async () => {
        const sql = `select * from class`;
        const [result] = await promisePool.query(sql);
        return result;
    },
}

// insert query
export const insertSql = {
    setStudent: async (data) => {
        const sql = `insert into student values (
            "${data.Id}",  "${data.Major}",  "${data.Club}",
            "${data.Name}", "${data.Email}", 
            "${data.PhoneNumber}"
        )`
        console.log(data);
        await promisePool.query(sql);
    },
};

// update query
export const updateSql = {
    updateStudent: async (data) => {
        console.log(data);
        const sql = `
            UPDATE Student 
            SET Sid = '${data.Id}', Major = '${data.Major}', ClubName = '${data.Club}',
            SName = '${data.Name}', SEmail = '${data.Email}', 
            SPhoneNumber = '${data.PhoneNumber}'
                
            WHERE Sid = '${data.Id}'
            `;
        console.log(sql);
        await promisePool.query(sql);
    },
    updateDepartment: async (data) => {
        console.log(data);
        const sql = `
            UPDATE Department
            SET Did = '${data.Id}', Dname = '${data.Name}', 
            Demail = '${data.Email}',
            DPhoneNumber = '${data.PhoneNumber}'
                
            WHERE Did = '${data.Id}'
            `;
        console.log(sql);
        await promisePool.query(sql);
    },
};

//delete Query
export const deleteSql = {
    deleteCalss: async (data) => {
        console.log('delete ClassId = ', data);
        const sql = `delete from Class where ClassId=${data.ClassId}`;
        console.log(sql);
        await promisePool.query(sql);
    }
};

//login Query
export const selectLoginSql = {
    getUser: async () => {
        const sql = `select * from student`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getClass: async (data) => {
        const sql = `select * from class where ClassId in (select ClassId from enroll where Sid=${data.id})`;
        const [result] = await promisePool.query(sql);
        return result;
    },
}

export const deleteLoginSql = {
    deleteClass: async (data) => {
        console.log('delete class Id =', data);
        const sql = `delete from enroll where ClassId=${data.ClassId}`
        console.log(sql);
        await promisePool.query(sql);
    },
};