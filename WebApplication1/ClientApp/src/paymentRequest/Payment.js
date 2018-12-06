﻿import axios from 'axios';


const getPayments = () => {
    return new Promise((resolve, reject) => {
        axios
            .get(`/api/paymentType/`)
            .then(res => {
                const paymentTypes = [];
                if (res.data !== null) {
                    Object.keys(res.data).forEach(payKey => {
                        res.data[payKey].id = payKey;
                        paymentTypes.push(res.data[payKey]);
                    });
                }
                resolve(paymentTypes);
            })
            .catch((err) => {
                reject(err);
            });
    });
};


const getPayment = id => {
    return new Promise((resolve, reject) => {
        axios
            .get(`api/paymentType/${id}`)
            .then(payment => resolve(payment.data[0]))
            .catch(error => reject(error));
    });
}

const postPayment = input => {
    return new Promise((resolve, reject) => {
        axios
            .post(`api/paymentType`, {
                account_number: input.account_number,
                customer_id: input.customer_id,
                active: input.active,
                title: input.price,

            })
            .then(res => 
                resolve(res))
            .catch(err =>
                reject(err))
            });
}




export default { getPayments, getPayment, postPayment};
