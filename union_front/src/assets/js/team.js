import Axios from 'axios';
import Qs from 'qs'
let prefix = "/api"

let token = window.localStorage.getItem('token');
Axios.defaults.headers.common["ClaireAuthorization"] = token;

// 关于team的相关接口
export default {
  /**
   * 获取社团列表 :可按照名称模糊搜索
   * @param {*} params :{pageSize,pageCurrent,teamname}
   */
  getAllTeam(params) {
    return new Promise((resolve, rejects) => {
      Axios.get(prefix + "/team/getAllTeam?pageCurrent=" +
          params.pageCurrent + "&pageSize=" + params.pageSize +
          "&teamname=" + params.teamname)
        .then(response => {
          resolve(response.data)
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },
  /**
   * 根据社团id得到社团信息
   * @param {*} params :社团id
   */
  getTeamById(params) {
    return new Promise((resolve, rejects) => {
      Axios.get(prefix + "/team/getTeamById?id=" + params)
        .then(response => {
          resolve(response.data)
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },
  /**
   * 根据社团类型得到社团列表
   * @param {*} params : type
   */
  getTeamsByType(params) {
    return new Promise((resolve, rejects) => {
      Axios.get(prefix + "/team/getTeamsByType?types=" + params)
        .then(response => {
          resolve(response.data)
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  /**
   * 申请加入社团
   * @param {*} params :apply
   */
  createApply(params) {
    return new Promise((resolve, rejects) => {
      Axios.post(prefix + "/apply/createApply", params)
        .then(response => {
          resolve(response.data)
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  /**
   * 判断某个用户是否在该社团中
   * @param {*} params 
   */
  isInThisTeam(params) {
    return new Promise((resolve, rejects) => {
      Axios.post(prefix + "/teamMember/isInTeam", params)
        .then(response => {
          resolve(response.data)
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  /**
   * 发起一个创建新社团的请求
   * @param {*} params 
   */
  createNewTeamApply(params) {
    return new Promise((resolve, rejects) => {
      Axios.post(prefix + "/createTeam/createTeamApply", params)
        .then(response => {
          resolve(response.data)
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  /**
   * 编辑社团，更新信息
   * @param {*} params 
   */
  updateTeamInfo(params) {
    return new Promise((resolve, rejects) => {
      Axios.post(prefix + "/team/updateTeamInfo", params)
        .then(response => {
          resolve(response.data)
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },
  /**
   * 判断当前登录用户 是否是该社团的管理员
   * @param {*} params 
   */
  isTeamManager(params) {
    return new Promise((resolve, rejects) => {
      Axios.get(prefix + "/team/isTeamManager?teamId=" + params)
        .then(response => {
          resolve(response.data)
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  /**
   * 管理页 返回社团数据
   * @param {*} params 
   */
  getManageTeam(params) {
    return new Promise((resolve, rejects) => {
      Axios.post(prefix + "/team/getManageTeam?current=" + params.current + "&size=" +
          params.size, params.team)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  /**
   * 获取所有请求创建社团的信息
   * @param {*} params 
   */
  getAllCreateApply(params) {
    return new Promise((resolve, rejects) => {
      Axios.post(prefix + "/createTeam/getAllCreateApply?current=" + params.current + "&size=" +
          params.size, params.createTeam)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  /**
   * 通过创建社团的申请
   * @param {*} params 
   */
  passCreateTeamApply(params) {
    return new Promise((resolve, rejects) => {
      Axios.get(prefix + "/createTeam/passCreateTeamApply?applyId=" + params)
        .then(response => {
          resolve(response.data)
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  /**
   * 拒绝创建社团的申请
   * @param {*} params 
   */
  refuseCreateTeamApply(params) {
    return new Promise((resolve, rejects) => {
      Axios.get(prefix + "/createTeam/refuseCreateTeamApply?applyId=" + params)
        .then(response => {
          resolve(response.data)
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  /**
   * 删除创建社团的申请
   * @param {*} params 
   */
  deleteCreateTeamApply(params) {
    return new Promise((resolve, rejects) => {
      Axios.get(prefix + "/createTeam/deleteCreateTeamApply?applyId=" + params)
        .then(response => {
          resolve(response.data)
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  /**
   * 获取关联表数据
   * @param {*} params 
   */
  getManageTM(params) {
    return new Promise((resolve, rejects) => {
      Axios.post(prefix + "/teamMember/getManageTM?current=" + params.current + "&size=" +
          params.size, params.teamMember)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  },

  /**
   * 删除关联数据
   * @param {*} params 
   */
  deleteRelate(params) {
    return new Promise((resolve, rejects) => {
      Axios.get(prefix + "/teamMember/deleteRelate?s_id=" + params.s_id + "&t_id=" + params.t_id)
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          console.log("Error", error);
        })
    })
  }

}
