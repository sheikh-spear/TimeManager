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
                    console.log(JSON.stringify(response.data));
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
}

export function isLoggedIn() {
    const isAuthenticated = localStorage.getItem("is-authenticated");
    return !!isAuthenticated;
}

export function setAuthenticated() {
    localStorage.setItem("is-authenticated", true);
}