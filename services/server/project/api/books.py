import os

from flask import Blueprint, jsonify
from project.api.models import Book

books_blueprint = Blueprint('books', __name__)


@books_blueprint.route('/books', methods=['GET', 'POST'])
def all_books():
    response_object = {'status': 'success', 'container_id': os.uname()[1],
                       'books': [book.to_json() for book in Book.query.all()]}
    return jsonify(response_object)


@books_blueprint.route('/books/ping', methods=['GET'])
def ping():
    return jsonify({
        'status': 'success',
        'message': 'pong!',
        'container_id': os.uname()[1]
    })


if __name__ == '__main__':
    app.run()
