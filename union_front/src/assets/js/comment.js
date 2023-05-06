import Axios from 'axios';
import Qs from 'qs'
let prefix = "/api"

let token = window.localStorage.getItem('token');
Axios.defaults.headers.common["ClaireAuthorization"] = token;

//关于评论的接口
export default {

  /**
   * 获取所有评论
   * @param {} params 
   */
  getComments(params) {
    return new Promise((resolve, rejects) => {
      Axios.post(prefix + "/comments/getComments?current=" + params.current + "&size=" +
          params.size, params.comments)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  /**
   * 获取所有回复
   * @param {} params 
   */
  getReplys(params) {
    return new Promise((resolve, rejects) => {
      Axios.post(prefix + "/reply/getReply?current=" + params.current + "&size=" +
          params.size, params.reply)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  /**
   * 新增一条评论
   * @param {*} params 
   */
  addNewComment(params) {
    return new Promise((resolve, rejects) => {
      Axios.post(prefix + "/comments/addNewComment", params)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  /**
   * 新增一条回复
   * @param {*} params 
   */
  addNewReply(params) {
    return new Promise((resolve, rejects) => {
      Axios.post(prefix + "/reply/addNewReply", params)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  /**
   * 新增一条评论的赞
   * @param {*} params 
   */
  addCommentSupport(params) {
    return new Promise((resolve, rejects) => {
      Axios.get(prefix + "/comments/addSupport?id=" + params)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  /**
   * 给回复增加一个赞
   * @param {*} params 
   */
  addReplySupport(params) {
    return new Promise((resolve, rejects) => {
      Axios.get(prefix + "/reply/addSupport?id=" + params)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  /**
   * 删除评论
   * @param {*} params 
   */
  deleteComment(params) {
    return new Promise((resolve, rejects) => {
      Axios.get(prefix + "/comments/deleteComment?id=" + params)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  /**
   * 删除回复
   * @param {*} params 
   */
  deleteReply(params) {
    return new Promise((resolve, rejects) => {
      Axios.get(prefix + "/reply/deleteReply?id=" + params)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },


}
