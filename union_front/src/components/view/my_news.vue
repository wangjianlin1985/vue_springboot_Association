// 个人中心->我的消息
<template>
  <div class="my_news">
    <h3>我的消息</h3>
    <div class="content mt20">
      <Table stripe :columns="columns" :data="news"></Table>
    </div>
    <div style="margin: 20px auto; text-align:center;">
      <Page
        :total="total"
        :current="params.current"
        :page-size="params.size"
        class="page"
        @on-change="pageChange"
      />
    </div>
  </div>
</template>
<script>
import LoginService from "../../assets/js/login.js";
import StudentService from "../../assets/js/student.js";
export default {
  name: "my_news",
  data() {
    return {
      params: {
        current: 1,
        size: 10
      },
      total: 0,
      columns: [
        {
          title: "申请人",
          key: "applyUsername"
        },
        {
          title: "申请理由",
          key: "reason"
        },
        {
          title: "申请时间",
          key: "createTime"
        },
        {
          title: "联系方式",
          key: "contactWay"
        },
        {
          title: "状态",
          key: "isPass",
          render: (h, params) => {
            //是否通过申请（0：等待处理 1：拒绝 2：通过）
            let str = "";
            switch (params.row.isPass) {
              case 0: {
                str = "等待处理";
                break;
              }
              case 1: {
                str = " 已拒绝";
                break;
              }
              case 2: {
                str = "已通过";
              }
            }
            return h("div", str);
          }
        },
        {
          title: "操作",
          render: (h, params) => {
            let passBtn = h(
              "Button",
              {
                props: {
                  type: "success",
                  size: "small"
                },
                on: {
                  click: () => {
                    StudentService.passApply(params.row).then(res => {
                      if (res.code == 0) {
                        this.$Message.success("已同意该用户的申请！");
                        location.reload();
                      } else {
                        this.$Message.error(res.msg);
                      }
                    });
                  }
                }
              },
              "通过"
            );

            let refuseBtn = h(
              "Button",
              {
                props: {
                  type: "warning",
                  size: "small"
                },
                on: {
                  click: () => {
                    StudentService.rejectApply(params.row).then(res => {
                      if (res.code == 0) {
                        this.$Message.success("已拒绝该用户的申请！");
                        location.reload();
                      } else {
                        this.$Message.error(res.msg);
                      }
                    });
                  }
                }
              },
              "拒绝"
            );

            let delBtn = h(
              "Button",
              {
                props: {
                  type: "error",
                  size: "small"
                },
                on: {
                  click: () => {
                    StudentService.deleteApply(params.row).then(res => {
                      if (res.code == 0) {
                        this.$Message.success("已删除该用户的申请！");
                        location.reload();
                      } else {
                        this.$Message.error(res.msg);
                      }
                    });
                  }
                }
              },
              "删除"
            );
            let btns = [];

            if (params.row.isPass != 0) {
              btns.push(delBtn);
            } else {
              btns.push(passBtn);
              btns.push(refuseBtn);
            }
            if (this.user.isManager > 0) {
              return h("div", btns);
            } else {
              return h("div", "您没有权限进行操作");
            }
          }
        }
      ],
      news: [],
      user: {}
    };
  },
  methods: {
    /*页码改变*/
    pageChange(page) {
      this.params.current = page;
      this.getTeams();
    },
    // 获取通知
    getNews() {
      LoginService.getApply(this.params).then(res => {
        if (res.code == 0) {
          this.news = res.data.records;
          this.total = res.data.total;
        } else {
          // this.$Message.error(res.msg);
        }
      });
    },
    // 获取该用户信息
    getUserInfo() {
      let vm = this;
      LoginService.getLoginUserInfo().then(res => {
        if (res.code == 0) {
          vm.user = res.data;
        } else {
          vm.$Message.error(res.msg);
        }
      });
    }
  },
  created() {
    this.getNews();
    this.getUserInfo();
  }
};
</script>
<style lang="scss">
// 标题
.my_news h3 {
  text-align: center;
}
</style>