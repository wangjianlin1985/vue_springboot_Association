// 创建社团的请求
// 用户管理
<template>
  <div class="m_createTeam">
    <Spin size="large" fix v-if="spinShow"></Spin>
    <!-- 检索条件  学号 管理员  姓名-->
    <Row class="condition">
      <ul class="flex">
        <li>
          <span class="title">社团名称：</span>
          <Input type="text" style="width:150px" v-model="params.createTeam.applyToName" />
        </li>
        <li class="ml10">
          <span class="title">社团类型：</span>
          <Select v-model="params.createTeam.teamType" style="width:150px">
            <Option v-for="item in typeList" :value="item.value" :key="item.value">{{ item.label }}</Option>
          </Select>
        </li>
        <li class="ml10" style="flex:1;">
          <span class="title">状态：</span>
          <Select v-model="params.createTeam.isPass" style="width:150px">
            <Option
              v-for="item in isPassList"
              :value="item.value"
              :key="item.value"
            >{{ item.label }}</Option>
          </Select>
        </li>
        <li>
          <Button type="primary" @click="getAllCreateApply">搜索</Button>
        </li>
      </ul>
    </Row>
    <!-- 表格 -->
    <Row class="mt20">
      <Table stripe :columns="columns" :data="applys"></Table>
    </Row>
    <!-- 分页 -->
    <div class="mdt20">
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
import TeamService from "../../assets/js/team.js";
import ConfirmModal from "./confirmModal";
export default {
  name: "createTeam",
  components: { ConfirmModal },
  data() {
    return {
      params: {
        current: 1,
        size: 10,
        createTeam: {
          applyToName: "", //社团名称
          teamType: 0, //社团类别
          isPass: -1 //是否通过
        }
      },
      applys: [], //请求数据
      typeList: [
        {
          value: 0,
          label: "所有类型"
        },
        {
          value: 1,
          label: "思想理论类"
        },
        {
          value: 2,
          label: "文艺体育类"
        },
        {
          value: 3,
          label: "就业创业类"
        },
        {
          value: 4,
          label: "公益服务类"
        },
        {
          value: 5,
          label: "学术科研类"
        },
        {
          value: 6,
          label: "网络信息类"
        }
      ], //社团类型列表
      isPassList: [
        {
          value: -1,
          label: "全部状态"
        },
        {
          value: 0,
          label: "待处理"
        },
        {
          value: 1,
          label: "已拒绝"
        },
        {
          value: 2,
          label: "已通过"
        }
      ],
      spinShow: false, //缓冲
      total: 0, //请求总数
      columns: [
        {
          title: "id",
          key: "id"
        },
        {
          title: "申请人id",
          key: "applyFromId"
        },
        {
          title: "社团名称",
          key: "applyToName"
        },
        {
          title: "社团类型",
          render: (h, params) => {
            let str = "";
            switch (params.row.teamType) {
              case 1:
                str = "思想理论类";
                break;
              case 2:
                str = "文艺体育类";
                break;
              case 3:
                str = "就业创业类";
                break;
              case 4:
                str = "公益服务类";
                break;
              case 5:
                str = "学术科研类";
                break;
              case 6:
                str = "网络信息类";
                break;
            }
            return h("div", str);
          }
        },
        {
          title: "申请理由",
          key: "reason"
        },
        {
          title: "联系方式",
          key: "contactWay"
        },
        {
          title: "申请时间",
          key: "createTime"
        },
        {
          title: "状态",
          render: (h, params) => {
            let str = "";
            switch (params.row.isPass) {
              case 0:
                str = "待处理";
                break;
              case 1:
                str = "已拒绝";
                break;
              case 2:
                str = "已通过";
                break;
            }
            return h("div", str);
          }
        },
        {
          title: "操作",
          render: (h, params) => {
            let vm = this;

            // 通过申请
            let passBtn = h(ConfirmModal, {
              props: {
                sureMsg: "您确认要通过该申请吗？",
                btnType: "2"
              },
              on: {
                func() {
                  TeamService.passCreateTeamApply(params.row.id).then(res => {
                    if (res.code == 0) {
                      vm.$Message.success("操作成功！");
                      location.reload();
                    } else {
                      vm.$Message.error(res.msg);
                    }
                  });
                }
              }
            });

            // 拒绝申请
            let refuseBtn = h(ConfirmModal, {
              props: {
                sureMsg: "您确认要拒绝该申请吗？",
                btnType: "3"
              },
              on: {
                func() {
                  TeamService.refuseCreateTeamApply(params.row.id).then(res => {
                    if (res.code == 0) {
                      vm.$Message.success("操作成功！");
                      location.reload();
                    } else {
                      vm.$Message.error(res.msg);
                    }
                  });
                }
              }
            });

            // 删除申请
            let delBtn = h(ConfirmModal, {
              props: {
                sureMsg: "您确认要删除该条数据吗？",
                btnType: "1"
              },
              on: {
                func() {
                  TeamService.deleteCreateTeamApply(params.row.id).then(res => {
                    if (res.code == 0) {
                      vm.$Message.success("操作成功！");
                      location.reload();
                    } else {
                      vm.$Message.error(res.msg);
                    }
                  });
                }
              }
            });

            let btns = [];
            if (params.row.isPass == 0) {
              btns.push(passBtn);
              btns.push(refuseBtn);
            }

            btns.push(delBtn);
            return h("div", btns);
          }
        }
      ]
    };
  },
  methods: {
    /*页码改变*/
    pageChange(page) {
      this.params.current = page;
      this.getAllCreateApply();
    },
    // 获取请求信息
    getAllCreateApply() {
      let vm = this;
      TeamService.getAllCreateApply(vm.params).then(res => {
        if (res.code == 0) {
          vm.applys = res.data.records;
          vm.total = res.data.total;
        } else {
          vm.$Message.error(res.msg);
        }
      });
    }
  },
  created() {
    this.spinShow = true;
    this.getAllCreateApply();
    this.spinShow = false;
  }
};
</script>
<style lang="scss">
// 检索条件
.m_createTeam .condition li span.title {
  width: 80px;
}
</style>