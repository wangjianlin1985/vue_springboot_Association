import Vue from 'vue'
import Router from 'vue-router'
import Index from '@/components/index'
import Teams from '@/components/teams'
import TeamDetail from '@/components/team_detail'
import PersonCenter from '@/components/person_center'
import PersonInfo from "@/components/view/person_info"
import PersonChange from "@/components/view/person_change"
import MyNews from "@/components/view/my_news"
import Activity from "@/components/activity"
import ActivityDetail from "@/components/activity_detail"

import AboutUs from "@/components/about_us"
import Manage from "@/components/manage"
import m_student from "@/components/manage_view/student"
import m_team from "@/components/manage_view/team"
import m_activity from "@/components/manage_view/activity"
import m_createTeam from "@/components/manage_view/createTeam"
import m_teamMember from "@/components/manage_view/teamMember"
import m_comment from "@/components/manage_view/comment"
import m_reply from "@/components/manage_view/reply"


Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [{
    path: '/',
    redirect: '/index'
  }, {
    path: '/index',
    name: 'index',
    component: Index //主页
  }, {
    path: '/teams',
    name: 'teams',
    component: Teams //社团页
  }, {
    path: '/team_detail',
    name: 'TeamDetail',
    component: TeamDetail //社团详情页
  }, {
    path: '/person_center',
    name: 'PersonCenter',
    component: PersonCenter, //个人中心
    children: [{
        path: "/",
        name: "",
        component: PersonInfo //默认显示：个人资料
      },
      {
        path: "/person_info",
        name: "person_info",
        component: PersonInfo //个人资料
      }, {
        path: "/person_change",
        name: "person_change",
        component: PersonChange //修改资料
      }, {
        path: "/my_news",
        name: "my_news",
        component: MyNews //修改资料
      }
    ]
  }, {
    path: '/activity',
    name: 'activity',
    component: Activity //活动页
  }, {
    path: '/activity_detail',
    name: 'activity_detail',
    component: ActivityDetail //活动详情页
  }, {
    path: "/about_us",
    name: "about_us",
    component: AboutUs
  }, {
    path: "/manage",
    name: "manage",
    component: Manage, //管理页
    children: [{
        path: '/',
        name: '',
        component: m_student //默认显示学生管理页
      },
      {
        path: '/m_student',
        name: 'm_student',
        component: m_student //学生管理页
      },
      {
        path: '/m_team',
        name: 'm_team',
        component: m_team //社团管理页
      },
      {
        path: '/m_activity',
        name: 'm_activity',
        component: m_activity //活动管理页
      },
      {
        path: '/m_createTeam',
        name: 'm_createTeam',
        component: m_createTeam //管理员获取 创建社团 的请求
      },
      {
        path: '/m_teamMember',
        name: 'm_teamMember',
        component: m_teamMember
      },
      {
        path: '/m_comment',
        name: 'm_comment',
        component: m_comment
      },
      {
        path: '/m_reply',
        name: 'm_reply',
        component: m_reply
      }
    ]
  }]
})
