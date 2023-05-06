// 个人中心->修改资料
<template>
  <div class="person_change">
    <h3>修改资料</h3>
    <div class="content">
      <ul>
        <li>
          <span>头像：</span>
          <img
            :src="'../../static/avatar_'+user.avatar+'.png'"
            alt="头像"
            class="avatar"
            title="点击修改头像"
            @click="showAvatarModal"
          />
        </li>
        <li>
          <span>学号：</span>
          {{user.sno}}
        </li>
        <li>
          <span>密码：</span>
          <Input type="text" v-model="password" maxlength="16" />
        </li>
        <li>
          <span>姓名：</span>
          <Input type="text" v-model="user.username" maxlength="5" />
        </li>
        <li>
          <span>性别：</span>
          {{user.sex?"女":"男"}}
        </li>
        <li>
          <span>手机号：</span>
          <Input type="text" v-model="user.phone" />
        </li>
        <li>
          <span>邮箱账号：</span>
          <Input type="text" v-model="user.email" />
        </li>
        <li>
          <span>个人简介：</span>
          <Input type="textarea" v-model="user.introduce" :autosize="false" :rows="4" />
        </li>
        <li>
          <span>创建时间：</span>
          {{user.createTime}}
        </li>
        <li style="justify-content:center;" class="mt20">
          <Button type="primary" @click="sureChangeModal=true">保存修改</Button>
        </li>
      </ul>
    </div>
    <Modal v-model="showAvatarChangeModal" title="头像选择" @on-cancel="showAvatarChangeModal=false">
      <ul class="avatat_list">
        <li v-for="item in avatarList" :key="item.index" @click="choosedAvatar(item.index)">
          <img
            :src="'../../static/avatar_'+item.index+'.png'"
            alt="头像"
            :class=" item.checked?'choosed avatar':'avatar'"
          />
        </li>
      </ul>
    </Modal>
    <!-- 确认修改提醒框 -->
    <Modal
      v-model="sureChangeModal"
      title="操作提醒"
      @on-cancel="sureChangeModal=false"
      @on-ok="personUpdate"
    >
      <h3>确认修改吗？</h3>
    </Modal>
  </div>
</template>

<script>
import StudentService from "../../assets/js/student.js";
import LoginService from "../../assets/js/login.js";
export default {
  name: "person_change",
  data() {
    return {
      user: {}, //用户信息
      password: "", //密码
      showAvatarChangeModal: false, //头像更换窗口
      avatarList: [
        { index: 1, checked: false },
        { index: 2, checked: false },
        { index: 3, checked: false },
        { index: 4, checked: false },
        { index: 5, checked: false },
        { index: 6, checked: false }
      ], //头像列表
      sureChangeModal: false //确认选择提示框
    };
  },
  methods: {
    // 获取用户信息
    getUserInfo() {
      let vm = this;
      LoginService.getLoginUserInfo().then(res => {
        if (res.code == 0) {
          vm.user = res.data;
          vm.avatarList[vm.user.avatar - 1].checked = true;
        } else {
          vm.$Message.error(res.msg);
        }
      });
    },
    // 打开头像更换  对话框
    showAvatarModal() {
      this.showAvatarChangeModal = true;
    },
    // 选中头像
    choosedAvatar(index) {
      let vm = this;
      for (var i = 0; i < vm.avatarList.length; i++) {
        vm.avatarList[i].checked = false;
      }
      vm.avatarList[index - 1].checked = true;
      vm.user.avatar = index;
    },
    // 确认更换头像
    sureChangeAvatar() {
      this.showAvatarChangeModal = false;
    },
    // 验证输入
    validateInput() {
      let vm = this;
      // 验证密码：不能小于6位
      if (vm.password != "" && vm.password.length < 6) {
        vm.$Message.error("密码长度不能小于6位！");
        return false;
      }

      if (vm.password != "") {
        vm.user.password = vm.password;
      }
      // 验证姓名
      if (vm.user.username == "") {
        vm.$Message.error("姓名不能为空！");
        return false;
      }
      // 验证手机号
      let reg = /^1[0-9]{10}$/;
      if (vm.user.phone != "" && vm.user.phone != null) {
        if (vm.user.phone.length <= 10 || !reg.test(vm.user.phone)) {
          vm.$Message.error("请输入正确的手机号！");
          return false;
        }
      }
      // 验证邮箱账号
      let regEmail = /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
      if (vm.user.email != "" && vm.user.email != null) {
        if (!regEmail.test(vm.user.email)) {
          vm.$Message.error("请输入正确的邮箱账号！");
          return false;
        }
      }
      return true;
    },
    //修改用户信息
    personUpdate() {
      let vm = this;
      vm.validateInput();
      StudentService.updateStudent(vm.user).then(res => {
        if (res.code == 0) {
          vm.$Message.success(res.msg);
        } else {
          vm.$Message.error(res.msg);
        }
      });
    }
  },
  created() {
    this.getUserInfo();
  }
};
</script>

<style lang="scss">
// 标题
.person_change h3 {
  text-align: center;
}
// 修改资料主体
.person_change .content {
  margin-top: 10px;
  border: 1px solid #ddd;
  padding: 20px;
  font-size: 18px;
}
// 修改改资 列表项
.person_change .content li {
  line-height: 40px;
  display: flex;
}
.person_change .content li span {
  display: inline-block;
  width: 100px;
}
.person_change .content li .avatar {
  width: 50px;
  height: 50px;
  border: 1px solid $base_color;
  border-radius: 50%;
  cursor: pointer;
}
.avatat_list li {
  display: inline-block;
  margin-left: 20px;
}
.avatat_list .avatar {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  cursor: pointer;
}
.avatat_list .avatar.choosed {
  border: 2px solid $base_color;
}
.avatat_list .avatar:hover {
  transform: scale(1.5);
}
</style>