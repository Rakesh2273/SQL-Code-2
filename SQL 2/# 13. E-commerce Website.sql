from flask import Flask, render_template, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///ecommerce.db'
db = SQLAlchemy(app)

class Product(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    price = db.Column(db.Float, nullable=False)

class CartItem(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    product_id = db.Column(db.Integer, db.ForeignKey('product.id'), nullable=False)
    quantity = db.Column(db.Integer, nullable=False)

@app.route('/')
def index():
    products = Product.query.all()
    return render_template('index.html', products=products)

@app.route('/product/<int:id>')
def product(id):
    product = Product.query.get_or_404(id)
    return render_template('product.html', product=product)

@app.route('/add_to_cart/<int:id>', methods=['POST'])
def add_to_cart(id):
    quantity = request.form['quantity']
    new_item = CartItem(product_id=id, quantity=quantity)
    db.session.add(new_item)
    db.session.commit()
    return redirect(url_for('index'))

@app.route('/cart')
def cart():
    cart_items = CartItem.query.all()
    return render_template('cart.html', cart_items=cart_items)

@app.route('/checkout')
def checkout():
    # Logic for checkout
    return render_template('checkout.html')

if __name__ == '__main__':
    app.run(debug=True
