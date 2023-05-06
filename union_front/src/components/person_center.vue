// 个人中心:管理员
<template>
  <div class="person_center">
    <Row type="flex" justify="space-between" class="code-row-bg">
      <Col span="4">
        <Card class="mt20" style="min-width:300px;">
          <Menu theme="light" style="z-index:1;" width="auto" activeName="person_info">
            <MenuItem name="person_info" to="/person_info">
              <Icon type="md-person" />个人资料
            </MenuItem>
            <MenuItem name="person_change" to="/person_change">
              <Icon type="ios-brush" />修改资料
            </MenuItem>
            <MenuItem name="my_news" to="/my_news">
              <Icon type="ios-chatbubbles" />消息通知
            </MenuItem>
          </Menu>
        </Card>
      </Col>
      <Col span="19">
        <Card class="mt20" style="min-height: 600px;">
          <router-view></router-view>
        </Card>
      </Col>
    </Row>
  </div>
</template>
<script>
export default {};
</script>
<style lang="scss">
.person_center {
  width: 90%;
  margin: 20px auto;
}
</style>
