<template>
<div>
  <b-navbar type="dark" variant="dark">
    <b-navbar-nav>
      <b-nav-item href="#">Dashboard</b-nav-item>

      <!-- Navbar dropdowns -->
      <b-nav-item-dropdown text="Manage" right>
        <b-dropdown-item href="#">Employees</b-dropdown-item>
        <b-dropdown-item href="#">Teams</b-dropdown-item>
      </b-nav-item-dropdown>
    </b-navbar-nav>
    <b-navbar-nav class="ml-auto">
        <b-nav-item href="#">My Account<i class="fas fa-user-circle"></i></b-nav-item>
    </b-navbar-nav>
  </b-navbar>
</div>
</template>

<script>
export default {
  name: "Navbar",
};
</script>

<style>
.nav-link {
    color: white !important;
}
ul {
    left: 0 !important;
}
</style>
