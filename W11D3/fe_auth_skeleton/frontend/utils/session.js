// AJAX requests

// creating a user
export const postUser = user => (
    $.ajax({
        url: '/api/users',
        method: 'POST',
        data: { user }, // user object
    })
);

// logging in a user
export const postSession = user => (
    $.ajax({
        url: 'api/session',
        method: 'POST',
        data: { user },
    })
);

// signing out a user (delete method)
export const deleteSession = () => (
    $.ajax({
        url: '/api/session',
        method: 'DELETE',
    })
);