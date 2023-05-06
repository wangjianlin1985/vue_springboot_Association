import Axios from 'axios';
let prefix = "/api"

//header注入token
let token = window.localStorage.getItem('token');
Axios.defaults.headers.common["ClaireAuthorization"] = token;

//关于 登录 的接口 
export default {
  /**
   * 登录
   * @param {*} params :sutdent
   */
  login(params) {
    return new Promise((resolve, rejects) => {
      Axios.post(prefix + "/login", params)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },
  /**
   * 已经登录的时候，通过token获取已经登录的用户信息
   */
  getLoginUserInfo() {
    return new Promise((resolve, rejects) => {
      Axios.post(prefix + "/getLoginUser")
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },
  /**
   * 管理员获取申请信息
   * @param {*} params 
   */
  getApply(params) {
    return new Promise((resolve, rejects) => {
      Axios.get(prefix + "/apply/getApply?current=" + params.current + "&size=" + params.size)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  /**
   * 退出登录
   */
  logout() {
    return new Promise((resolve, rejects) => {
      Axios.get(prefix + "/logout")
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  /**
   * 忘记密码=> 发送验证码
   * @param {} params 
   */
  sendEmail(params) {
    return new Promise((resolve, rejects) => {
      Axios.get(prefix + "/sendEmail?to_email=" + params)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  /**
   * 重置密码
   * @param {学号} sno  
   * @param {密码} password   
   */
  updatePassword(sno, password) {
    return new Promise((resolve, rejects) => {
      Axios.get(prefix + "/student/updatePassword?s_no=" + sno + "&password=" + password)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  }
}
