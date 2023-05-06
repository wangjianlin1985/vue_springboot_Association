// 活动管理
<template>
  <div class="m_activity">
    <Spin size="large" fix v-if="spinShow"></Spin>
    <!-- 检索条件  举办的社团名称  活动名称-->
    <Row class="condition">
      <ul class="flex">
        <li>
          <span class="title">举办社团：</span>
          <Input type="text" style="width:150px" v-model="params.activity.teamname" />
        </li>
        <li class="ml10" style="flex:1;">
          <span class="title">活动名称：</span>
          <Input type="text" style="width:150px" v-model="params.activity.activityName" />
        </li>
        <li>
          <Button type="primary" @click="getAllAct">搜索</Button>
        </li>
      </ul>
    </Row>
    <!-- 表格 -->
    <Row class="mt20">
      <Table stripe :columns="columns" :data="acts"></Table>
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
import ActivityService from "../../assets/js/activity.js";
import ConfirmModal from "./confirmModal";
export default {
  name: "activity",
  components: { ConfirmModal },
  data() {
    return {
      params: {
        current: 1,
        size: 10,
        activity: {
          teamname: "",
          activityName: ""
        }
      },
      acts: [], //活动数据
      spinShow: false, //缓冲
      total: 0, //活动总数
      columns: [
        {
          title: "id",
          key: "id"
        },
        {
          title: "活动名称",
          key: "activityName"
        },
        {
          title: "活动地点",
          key: "address"
        },
        {
          title: "主办社团",
          key: "teamname"
        },
        {
          title: "简介",
          key: "summary",
          width: "300"
        },
        {
          title: "活动资金",
          key: "money"
        },
        {
          title: "活动时间",
          key: "createTime"
        },
        {
          title: "操作",
          render: (h, params) => {
            let vm = this;

            let detailBtn = h(
              "Button",
              {
                props: {
                  type: "primary"
                },
                on: {
                  click: () => {
                    vm.$router.push({
                      path: "/activity_detail",
                      query: { activityId: params.row.id }
                    });
                  }
                }
              },
              "查看"
            );

            let delBtn = h(ConfirmModal, {
              props: {
                sureMsg: "您确认要删除该条数据吗？",
                btnType: "1"
              },
              on: {
                func() {
                  ActivityService.deleteActivity(params.row.id).then(res => {
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
            btns.push(detailBtn);
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
      this.getAllAct();
    },
    // 获取学生信息
    getAllAct() {
      let vm = this;
      vm.spinShow = true;
      ActivityService.getManageActivity(vm.params).then(res => {
        if (res.code == 0) {
          vm.acts = res.data.records;
          vm.total = res.data.total;
        } else {
          vm.$Message.error(res.msg);
        }
      });
      vm.spinShow = false;
    }
  },
  created() {
    this.getAllAct();
  }
};
</script>
<style lang="scss">
// 检索条件
.m_activity .condition li span.title {
  width: 80px;
}
</style>