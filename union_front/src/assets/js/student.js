import Axios from 'axios';
import Qs from 'qs'
let prefix = "/api"

let token = window.localStorage.getItem('token');
Axios.defaults.headers.common["ClaireAuthorization"] = token;

// 关于Student的相关接口
export default {
  /**
   * 根据学生id获取到学生的信息
   * @param {*} params :用户id
   */
  getStudentById(params) {
    return new Promise((resolve, rejects) => {
      Axios.get(prefix + "/student/getStudentById?id=" + params)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  /**
   * 注册 
   * @param {*} params:student
   */
  register(params) {
    return new Promise((resolve, rejects) => {
      Axios.post(prefix + "/student/register", params)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  /**
   * 修改用户信息
   * @param {*} params :student
   */
  updateStudent(params) {
    return new Promise((resolve, rejects) => {
      Axios.post(prefix + "/student/update", params)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },
  /**
   * 通过申请
   * @param {*} params 
   */
  passApply(params) {
    return new Promise((resolve, rejects) => {
      Axios.post(prefix + "/apply/passApply", params)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },
  /**
   * 拒绝申请
   * @param {*} params 
   */
  rejectApply(params) {
    return new Promise((resolve, rejects) => {
      Axios.post(prefix + "/apply/rejectApply", params)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },
  /**
   * 删除请求
   * @param {*} params 
   */
  deleteApply(params) {
    return new Promise((resolve, rejects) => {
      Axios.post(prefix + "/apply/deleteApply", params)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  //管理页

  /**
   * 获取所有学生
   * @param {*} params 
   */
  getAllStudent(params) {
    return new Promise((resolve, rejects) => {
      Axios.post(prefix + "/student/getAllStudent?current=" + params.current + "&size=" +
          params.size, params.student)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  /**
   * 删除学生
   * @param {*} params 
   */
  deleteStudent(params) {
    return new Promise((resolve, rejects) => {
      Axios.get(prefix + "/student/deleteStu?studentId=" + params)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  }

}
