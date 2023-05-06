// 登录组件
<template>
  <div class="login">
    <Spin size="large" fix v-if="spinShow"></Spin>
    <Button type="primary" @click="login_modal = true" v-if="!isLogin">登录</Button>
    <!-- 登录&注册 -->
    <Modal v-model="login_modal" :closable="false" width="420" class-name="vertical-center-modal">
      <div class="login_content">
        <p>
          <span class="login_title">学&emsp;号:</span>
          <Input
            type="text"
            placeholder="学号如:U201610000"
            style="width:200px;"
            v-model="userAccount"
            @on-blur="getAccount"
            @on-focus="showUserNotice=false"
          />
        </p>
        <p class="notice" v-if="showUserNotice" style="margin-top:3px;">用户名格式错误</p>
        <p>
          <span class="login_title">密&emsp;码:</span>
          <Input
            type="password"
            placeholder="如123456"
            maxlength="16"
            style="width:200px;"
            v-model="password"
            password
            @on-blur="getPassword"
            @on-focus="showPasswordNotice=false"
          />
        </p>
        <p class="notice" v-if="showPasswordNotice" style="margin-top:3px;">密码过短</p>
        <!-- 注册时显示 -->
        <p v-if="isRegister">
          <span class="login_title">确认密码:</span>
          <Input
            type="password"
            password
            maxlength="16"
            style="width:200px;"
            v-model="surePassword"
            @on-blur="getSurePassword"
            @on-focus="showPasswordSameNotice=false"
          />
        </p>
        <p class="notice" v-if="showPasswordSameNotice" style="margin-top:3px;">密码输入不一致</p>
        <p v-if="isRegister">
          <span class="login_title">用户名:</span>
          <Input type="text" maxlength="10" style="width:200px;" v-model="stuName" />
        </p>
      </div>
      <div class="flex justify_content_around" style="margin-top:20px;">
        <Button type="primary" style="width:100px;" @click="login" v-if="!isRegister">登录</Button>
        <Button type="primary" style="width:100px;" @click="register" v-if="isRegister">注册</Button>
        <Button type="primary" ghost style="width:100px;" @click="deleteLogin">取消</Button>
      </div>
      <div class="flex justify_content_between login_bottom">
        <a
          href="#"
          style="text-decoration: underline;color: #ccc;"
          @click="forgetPassword()"
          v-if="!isRegister"
        >忘记密码？</a>
        <a href="#" style="color:#ccc;" @click="showRegister(true)" v-if="!isRegister">注册新用户</a>
        <a href="#" style="color:#ccc;" @click="showRegister(false)" v-if="isRegister">返回登录</a>
      </div>
      <div slot="footer"></div>
    </Modal>

    <!-- 忘记密码 -->
    <Modal
      v-model="getPasswordModal"
      :closable="false"
      width="600"
      class-name="vertical-center-modal"
    >
      <div class="login_content">
        <p>
          <span class="login_title">学&emsp;号:</span>
          <Input type="text" placeholder="请输入您的学号..." style="width:200px;" v-model="userAccount" />
        </p>
        <!-- 发送验证码到邮箱 -->
        <div v-if="verifying">
          <p>
            <span class="login_title">邮&emsp;箱:</span>
            <Input
              type="text"
              placeholder="请输入您的邮箱..."
              style="width:200px;"
              v-model="email"
              @on-blur="getEmail"
              @on-focus="showEmailNotice=false"
            />
            <Button type="primary" style="float:right;" @click="getVerifyCode">获取验证码</Button>
          </p>
          <p class="notice" v-if="showEmailNotice" style="margin-top:3px;">请输入正确的邮箱！</p>
          <!-- 验证码 -->
          <p>
            <span class="login_title">验证码:</span>
            <Input type="text" style="width:200px;" v-model="inputCode" />
          </p>
          <div style="text-align:center;" class="mt20">
            <Button type="primary" style="width:100px;height:40px;" @click="verifyInputCode">验证</Button>
          </div>
        </div>

        <!-- 重置密码 -->
        <div v-else>
          <p>
            <span class="login_title">新密码:</span>
            <Input
              type="password"
              placeholder="如123456"
              maxlength="16"
              style="width:200px;"
              v-model="password"
              password
              @on-blur="getPassword"
              @on-focus="showPasswordNotice=false"
            />
          </p>
          <p class="notice" v-if="showPasswordNotice" style="margin-top:3px;">密码过短</p>

          <p>
            <span class="login_title">确认密码:</span>
            <Input
              type="password"
              password
              maxlength="16"
              style="width:200px;"
              v-model="surePassword"
              @on-blur="getSurePassword"
              @on-focus="showPasswordSameNotice=false"
            />
          </p>
          <p class="notice" v-if="showPasswordSameNotice" style="margin-top:3px;">密码输入不一致</p>
          <div style="text-align:center;" class="mt20">
            <Button type="primary" style="width:100px;height:40px;" @click="updataPassword">确定</Button>
          </div>
        </div>
        <div class="flex justify_content_between login_bottom">
          <a href="#" style="color:#ccc;" @click="showRegister(false)">返回登录</a>
        </div>
      </div>
      <div slot="footer"></div>
    </Modal>

    <!-- 已经登录:显示用户信息 -->

    <router-link to="/person_center" title="点此进入个人中心">
      <div v-if="isLogin" class="person_info flex align_items_centeer">
        <img :src="'../../static/avatar_'+user.avatar+'.png'" alt="头像" class="avatar" />
        <p class="username">
          <img
            src="../../assets/img/manager_logo.png"
            alt="manager_logo"
            style="width:20px;vertical-align: middle;"
            v-if="user.isManager>0"
          />
          {{user.username}}
        </p>
      </div>
    </router-link>
  </div>
</template>
<script>
import StudentService from "../../assets/js/student.js";
import LoginService from "../../assets/js/login.js";
export default {
  name: "login",
  data() {
    return {
      login_modal: false,
      userAccount: "U201610000", //用户名
      password: "123456", //密码
      showUserNotice: false, //用户名输入提示
      showPasswordNotice: false, //密码输入提示
      user: {}, //用户信息
      isLogin: false, //判断是否登录
      register_model: false, //注册
      surePassword: "", //二次输入的密码
      showPasswordSameNotice: false, //密码输入不一致提示
      isRegister: false, //是否是注册
      stuName: "", //注册的用户名
      getPasswordModal: false, //忘记密码对话框
      email: "", //邮箱
      showEmailNotice: false, //邮箱格式提示
      verifyCode: "", //验证码
      inputCode: "", //输入的验证码
      verifying: true, //是否处于验证阶段
      spinShow: false
    };
  },
  methods: {
    // 验证邮箱
    getEmail() {
      let vm = this;
      let regEmail = /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
      if (vm.email != "" && vm.email != null) {
        if (!regEmail.test(vm.email)) {
          vm.showEmailNotice = true;
        }
      }
    },
    // 验证用户名长短
    getAccount() {
      // if (this.userAccount.length != 10) {
      //   this.showUserNotice = true;
      // }
    },
    //验证密码长短
    getPassword() {
      if (this.password.length < 6 && this.password.length > 0) {
        this.showPasswordNotice = true;
      }
    },
    //打开登录页面 / 注册页面
    showRegister(isShow) {
      this.isRegister = isShow;
      this.login_modal = true;
      this.getPasswordModal = false;
    },
    //验证二次输入密码是否一致
    getSurePassword() {
      if (this.password != this.surePassword) {
        this.showPasswordSameNotice = true;
      }
    },
    //登录
    login() {
      let vm = this;
      if (vm.password.length < 6) {
        vm.$Message.error("用户名或密码错误");
      }
      let params = {
        sno: vm.userAccount,
        password: vm.password
      };
      LoginService.login(params).then(res => {
        if (res.code == 0) {
          vm.$store.store.commit("handleToken", res.data.userToken); //把token存入vuex
          vm.user = res.data.student; //当前用户信息
          vm.$Message.success("欢迎你，" + vm.user.username);
          vm.login_modal = false;
          vm.isLogin = true;
          vm.$router.push("/index");
          location.reload();
        } else {
          vm.$Message.error(res.data);
        }
      });
    },
    //验证输入信息
    validateInput() {
      let vm = this;
      //用户名判断
      if (vm.userAccount.length != 10) {
        vm.$Message.error("用户名格式错误！");
        return;
      }
      //密码判断
      if (vm.password.length < 6) {
        vm.$Message.error("至少需要六位密码！");
        return;
      }
      if (this.password != this.surePassword) {
        vm.$Message.error("两次密码输入不一致！");
        return;
      }
      //用户名判断
      if (vm.stuName.length == 0) {
        vm.$Message.error("用户名不得为空!");
        return;
      }
    },
    //注册
    register() {
      let vm = this;
      vm.validateInput();
      let params = {
        sno: vm.userAccount,
        username: vm.stuName,
        password: vm.password
      };
      StudentService.register(params).then(res => {
        if (res.code == 0) {
          //表示插入成功
          vm.$Message.success("注册成功，请返回登录！");
        } else {
          vm.$Message.error(res.data);
        }
      });
    },
    // 获取用户信息
    getUserInfo() {
      let vm = this;
      LoginService.getLoginUserInfo().then(res => {
        if (res.code == 0) {
          vm.user = res.data;
          vm.$Message.success("欢迎你，" + vm.user.username);
        } else {
          vm.$Message.error(res.msg);
        }
      });
    },
    //取消登录
    deleteLogin() {
      this.login_modal = false;
    },
    // 打开忘记密码对话框
    forgetPassword() {
      this.login_modal = false;
      this.getPasswordModal = true;
    },
    // 获取验证码
    getVerifyCode() {
      let vm = this;
      LoginService.sendEmail(vm.email).then(res => {
        if (res.code == 0) {
          vm.verifyCode = res.data;
          vm.$Message.success("验证码已发送至邮箱，请查收~");
        } else {
          vm.$Message.error(res.msg);
        }
      });
    },
    // 验证  验证码
    verifyInputCode() {
      let vm = this;
      if (vm.inputCode == "") {
        vm.$Message.error("请输入验证码!");
      } else {
        if (vm.inputCode != vm.verifyCode) {
          vm.$Message.error("验证失败！");
        } else {
          vm.$Message.success("验证通过！");
          vm.verifying = false;
        }
      }
    },
    // 更新密码
    updataPassword() {
      let vm = this;
      vm.spinShow = true;
      LoginService.updatePassword(vm.userAccount, vm.password).then(res => {
        if (res.code == 0) {
          vm.$Message.success("更新成功！");
        } else {
          vm.$Message.error(res.msg);
        }
        vm.spinShow = false;
      });
    }
  },
  created() {
    // 已经登录
    this.isLogin = window.localStorage.getItem("token") != (null || undefined);
    if (this.isLogin) {
      this.getUserInfo();
    }
  }
};
</script>
<style lang="scss">
.login_content {
  margin: 0 auto;
  width: 80%;
}
.login_content .login_title {
  display: inline-block;
  width: 100px;
  font-size: 20px;
}
// 提示
.notice {
  font-size: 14px;
  color: red;
  margin-left: 105px;
}
.login_content p {
  margin-top: 20px;
}
.ivu-modal-footer {
  border-top: none;
}
.vertical-center-modal {
  display: flex;
  align-items: center;
  justify-content: center;

  .ivu-modal {
    top: 0;
  }
}

.login_bottom {
  width: 80%;
  margin: 0 auto;
  margin-bottom: -20px;
  margin-top: 15px;
}
.person_info .avatar {
  width: 50px;
  height: 50px;
  border: 3px solid $base_color;
  border-radius: 50%;
}
.person_info .username {
  margin-left: 10px;
  font-size: 20px;
  color: $base_color;
}
</style>