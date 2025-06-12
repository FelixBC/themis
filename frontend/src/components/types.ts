import {date} from "quasar";
import {ref} from "vue";

export interface Author {
    id: number;
    name: string;
}

export interface Employee {
    id: number;
    name: string;
    identification: string;
    sector: string;
    province: string;
    city: string;
    address: string;
    birthdate: date;
    gender: number;
    phoneNumber: string;
    email: number;
    salary: number;
}

export interface Email {
    id: number;
    email: string;
}

export interface Phone {
    id: number;
    phoneNumber: string;
}

export interface Province {
    id: number;
    name: string;
}

export interface City {
    id: number;
    name: string;
}

export interface Sector {
    id: number;
    name: string;
}

export interface Identification {
    id: number;
    name: string;
}

export interface Address {
    id: number;

}

export interface User {
    id: number;
    email: string;
    password: string;
}

export interface Role {
    id: number;
    name: string;
}

export interface Contact {
    id: number;
    ID_email: number;
}

export interface Gender {
    id: number;
    name: string;
}

export interface Genre {
    id: number;
    name: string;
}
export interface Product {
    id: number;
    name: string;
    description: string;
    price: number;
    stock: number;
    idSupplier: number;
    idCategory: number;
    idBrand: number;
}
export interface People{
    id: number;
    name: string;
    identification: string;
    idGender: number;
    idProvince: number;
    idCity: number;
    idSector: number;
    address: string;
    birthdate: date;
    phoneNumber: string;
    email: string;
}
export interface SupplierType {
    id: number;
    name: string;
}
export interface SupplierCategory {
    id: number;
    name: string;
}
export interface ReservationSpace {
    id: number;
    name: string;
    capacity: number;
    availability: string;
}

export interface Event {
    id: number;
    name: string;
    eventDate: string;
    description: string;
    imageUrl: string;
    capacity: integer;
}
export interface Reservation {
    id: number;
    eventId: number;
    clientId: number;
    statusId: number;
}
export interface Order {
    id: number;
    trackingNumber: string;
    supplierID: number;
    userID: number;
    totalOrder: number;
    deliveryDate: string;
    realArrivalDate: string;
    paymentMethodID: number;
    status: string;
}
export interface OrderDetail {
    id: number;
    orderID: number;
    productTypeID: number;
    quantity: number;
    unitPrice: number;
}
export interface Book {
    id: number;
    authorId: number;
    title: string;
    isbn: string;
    genreId: number;
    quantity: number;
    price: float;
    rating: number;
    rented: number;
}
export interface Author {
    id: number;
    name: string;
}

export interface ReservationStatus {
    id: number;
    name: string;
}

export interface BookCheckoutStatus {
    id: number;
    name: string;
}

export interface BookCheckout {
    id: number;
    bookId: number;
    clientId: number;
    statusId: number;
}