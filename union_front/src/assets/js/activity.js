import Axios from 'axios';
import Qs from 'qs'
let prefix = "/api"

let token = window.localStorage.getItem('token');
Axios.defaults.headers.common["ClaireAuthorization"] = token;

// 关于活动的相关接口
export default {
  /**
   * 获取活动列表，可选条件：社团id
   * @param {} params 
   */
  getActivity(params) {
    return new Promise((resolve, rejects) => {
      Axios.get(prefix + "/activity/getActivity?current=" +
          params.current + "&size=" + params.size +
          "&teamId=" + params.teamId)
        .then(response => {
          resolve(response.data)
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },
  /**
   * 根据活动id  获取活动详情
   * @param {*} params 
   */
  getActivityById(params) {
    return new Promise((resolve, rejects) => {
      Axios.get(prefix + "/activity/getActivityById?activityId=" + params)
        .then(response => {
          resolve(response.data)
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  //管理页

  /**
   * 获取所有活动
   * @param {} params 
   */
  getManageActivity(params) {
    return new Promise((resolve, rejects) => {
      Axios.post(prefix + "/activity/getManageActivity?current=" + params.current + "&size=" +
          params.size, params.activity)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  /**
   * 根据id删除活动
   * @param {*} params 
   */
  deleteActivity(params) {
    return new Promise((resolve, rejects) => {
      Axios.get(prefix + "/activity/deleteActivity?actId=" + params)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  /**
   * 新增活动
   * @param {*} params 
   */
  addNewActivity(params) {
    return new Promise((resolve, rejects) => {
      Axios.post(prefix + "/activity/addNewAc", params)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  }
}
