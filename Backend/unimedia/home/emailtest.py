import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

def send_email():
    try:
        # Email settings
        sender_email = "nabil4457@gmail.com"
        receiver_email = "tasdidhasnain036@gmail.com"
        password = "poowuwyfnkksboje"
        
        # Set up the server
        server = smtplib.SMTP("smtp.gmail.com", 587)
        server.starttls()  # Secure the connection
        server.login(sender_email, password)
        
        # Set up the email
        msg = MIMEMultipart()
        msg['From'] = sender_email
        msg['To'] = receiver_email
        msg['Subject'] = "Test Email"
        body = "This is a test email"
        msg.attach(MIMEText(body, 'plain'))
        
        # Send the email
        server.sendmail(sender_email, receiver_email, msg.as_string())
        print("Email sent successfully!")
    
    except Exception as e:
        print(f"Error sending email: {e}")
    
    finally:
        server.quit()

send_email()
