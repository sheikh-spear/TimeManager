import axios from 'axios'

export function loginUser(email, password) {

    var data = JSON.stringify({
        email,
        password
    });

    var config = {
        method: "post",
        url: `users/sign_in`,
        headers: {
            "X-Requested-With": "XMLHttpRequest",
            "Content-Type": "application/json"
        },
        data: data
    };

    return new Promise((resolve, reject) => {

        try {

            axios(config)
                .then(function (response) {
                    setManager(response.data.data.user.is_manager);

                })
                .catch(function (error) {
                    console.log(error);
                });

            setAuthenticated();
            resolve();
        }
        catch (err) {
            console.error('Caught an error during login:', err)
            reject(err)
        }
    })
}

export function logoutUser() {
    localStorage.removeItem("is-authenticated");
    localStorage.removeItem("is-manager");
}

export function isLoggedIn() {
    const isAuthenticated = localStorage.getItem("is-authenticated");
    return !!isAuthenticated;
}

export function isManager() {
    return !!localStorage.getItem("is-manager");
}

export function setAuthenticated() {
    localStorage.setItem("is-authenticated", true);
}

export function setManager(boolean) {
    localStorage.setItem("is-manager", boolean);
}