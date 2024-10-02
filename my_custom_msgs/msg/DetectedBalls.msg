import rospy
from geometry_msgs.msg import Point
from std_msgs.msg import Header
from geometry_msgs.msg import PointStamped
import random
import time

def publish_balls():
    # Inicializa o nó ROS
    rospy.init_node('balls_publisher', anonymous=True)
    
    # Cria um publisher para publicar o array de pontos
    pub = rospy.Publisher('detected_balls', PointStamped, queue_size=10)
    
    rate = rospy.Rate(1)  # Taxa de 1 Hz (1 segundo)
    
    while not rospy.is_shutdown():
        # Cria um array de pontos (5 pontos aleatórios como exemplo)
        balls = [Point(random.uniform(-10, 10), random.uniform(-10, 10), random.uniform(-10, 10)) for _ in range(5)]
        
        for ball in balls:
            # Cria uma mensagem PointStamped
            point_stamped = PointStamped()
            point_stamped.header = Header()
            point_stamped.header.stamp = rospy.Time.now()
            point_stamped.point = ball
            
            # Publica o ponto
            pub.publish(point_stamped)
        
        # Espera 60 segundos antes de publicar novamente
        rospy.loginfo("Publicando bolas detectadas...")
        time.sleep(60)  # Espera 60 segundos

if __name__ == '__main__':
    try:
        publish_balls()
    except rospy.ROSInterruptException:
        pass
