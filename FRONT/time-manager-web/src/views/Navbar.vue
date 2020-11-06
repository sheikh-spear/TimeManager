<template>
  <div>
    <b-navbar type="dark" variant="dark">
      <b-navbar-nav>
        <b-nav-item to="/">Dashboard</b-nav-item>
        <b-nav-item-dropdown text="Manage" right>
          <b-dropdown-item to="/users">Employees</b-dropdown-item>
          <b-dropdown-item to="/teams">Teams</b-dropdown-item>
        </b-nav-item-dropdown>
      </b-navbar-nav>
      <b-navbar-nav class="ml-auto">
        <b-nav-item>My Account</b-nav-item>
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
.link {
  color: #212529;
}
</style>
