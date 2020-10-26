import { rest } from 'msw'
export const handlers = [
    // Handles a POST /login request
    rest.post('/api/users/sign_in', (req, res, ctx) => {
        // Persist user's authentication in the session
        localStorage.setItem('is-authenticated', true);
        return res(
            // Respond with a 200 status code
            ctx.status(200),
            ctx.json({
                "data": {
                    "user": {
                        "email": "user1@email.com",
                        "id": "600db4ce-9f78-4494-be65-404bfba45d82"
                    }
                }
            })
        )

        //Error case here
        // return res(
        //     // Respond with a 500 status code
        //     ctx.status(403),
        //     ctx.json({
        //         "errors": {
        //             "detail": "Wrong email or password"
        //         }
        //     })
        // )
    }),
    // Handles a GET /user request
    rest.get('/user', null),
]