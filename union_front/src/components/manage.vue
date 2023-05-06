// 管理页
<template>
  <div class="manage">
    <Spin size="large" fix v-if="spinShow"></Spin>
    <!-- 如果不是管理员 -->
    <div v-if="user.isManager!=2" class="flex align_items_centeer justify_content_around">
      <img src="../assets/img/no_access.png" alt="您无权访问" style="width:400px;" />
    </div>
    <!-- 管理页面 -->
    <div v-else style="width:80%;margin:20px auto;">
      <Row type="flex" justify="space-between" class="code-row-bg">
        <Col span="4">
          <Card class="mt20" style="min-width:180px;">
            <Menu theme="light" style="z-index:1;width:150px;">
              <MenuItem name="m_student" to="/m_student">
                <Icon type="md-contacts" />用户管理
              </MenuItem>
              <MenuItem name="m_team" to="/m_team">
                <Icon type="ios-chatbubbles" />社团信息
              </MenuItem>
              <MenuItem name="m_activity" to="/m_activity">
                <Icon type="ios-football" />活动管理
              </MenuItem>
              <MenuItem name="m_teamMember" to="/m_teamMember">
                <Icon type="md-folder" />社团成员
              </MenuItem>
              <MenuItem name="m_createTeam" to="/m_createTeam">
                <Icon type="md-settings" />社团管理
              </MenuItem>
              <MenuItem name="m_comment" to="/m_comment">
                <Icon type="md-text" />评论管理
              </MenuItem>
              <MenuItem name="m_reply" to="/m_reply">
                <Icon type="ios-text" />回复管理
              </MenuItem>
            </Menu>
          </Card>
        </Col>
        <Col span="19">
          <Card class="mt20">
            <router-view></router-view>
          </Card>
        </Col>
      </Row>
    </div>
  </div>
</template>
<script>
import LoginService from "../assets/js/login.js";
export default {
  name: "manage",
  data() {
    return {
      user: {}, //管理员信息
      spinShow: false //缓冲
    };
  },
  methods: {
    // 获取用户信息
    getUserInfo() {
      let vm = this;
      vm.spinShow = true;
      LoginService.getLoginUserInfo().then(res => {
        if (res.code == 0) {
          vm.user = res.data;
        } else {
          vm.$Message.error(res.msg);
        }
      });
      vm.spinShow = false;
    }
  },
  created() {
    this.getUserInfo();
  }
};
</script>