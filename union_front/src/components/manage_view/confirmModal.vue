// 操作确认框
// 调用  <ConfirmModal sureMsg="确认删除吗？" @func="方法名" btnType="1"></ConfirmModal>
// 按钮类别 ： 1-删除  2-通过请求 3-拒绝申请
<template>
  <div class="sureOp">
    <!-- 删除 -->
    <Button @click="showOPModal=true" type="error" v-if="btnType=='1'">删除</Button>
    <!-- 通过 -->
    <Button @click="showOPModal=true" type="success" v-if="btnType=='2'">通过</Button>
    <!-- 拒绝 -->
    <Button @click="showOPModal=true" type="warning" v-if="btnType=='3'">拒绝</Button>
    <Modal v-model="showOPModal" @on-cancel="showOPModal=false" @on-ok="sureOP" title="操作提醒">
      <h3>{{sureMsg}}</h3>
    </Modal>
  </div>
</template>
<script>
export default {
  name: "confirmModal",
  props: {
    sureMsg: {
      type: String,
      default: ""
    },
    btnType: {
      type: String,
      default: "1"
    }
  },
  data() {
    return {
      showOPModal: false
    };
  },
  methods: {
    sureOP() {
      this.$emit("func");
    }
  }
};
</script>