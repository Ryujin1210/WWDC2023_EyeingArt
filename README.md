# WWDC2023_Swift Student Challenge [Accepted]

(EN)

## Why I Made 

I really want you to see why I made this app.

Watching Apple's "The Greatest" commercial video, I was inspired by the warm emotions and values of life held by the physically disabled. The video shows people with disabilities enjoying various cultural activities in their lives, as well as touching scenes of spending time together feeling respect and warmth.

However, in fact, people with physical disabilities often have difficulty fully immersing themselves in cultural life in their lifestyles. It was a pity that even my close people could not enjoy art creation when they were physically uncomfortable. Through this, I realized how important it is to provide cultural activities that anyone can enjoy regardless of physical disability.

So I found a way to solve this problem and created art content that disabled people can enjoy. It is called Eyeing Art.

Eyeing Art is an app that helps people draw using eye movements and facial expressions. Through Eyeing Art, disabled people can enjoy drawing with only their eyes and facial expressions. I want to make it easier for people with physical disabilities to enjoy art creation activities.

I hope loved ones and people with physical disabilities will have a good time drawing various pictures through Eyeing Art. And with my app, I hope to have a positive impact on their lives.

But it's not just about making apps. Through this, I aim to create a warmer, more diverse and inclusive world. I will continue to work hard to create apps that can help someone and be a catalyst for a better world.

I hope you can use my app and feel warm! 

Additionally, my app only works on real devices because of camera use

## Description

This app uses eye movements and facial expressions to draw pictures.
I created for people who have difficulty drawing due to disabilities. 

It is mostly recommended to run this app on Xcode & 11 inch iPad Pro.

It uses the ARKit and SceneKit frameworks to track the user's eye movements and visualize them, while using SwiftUI to create the start screen and explanation section.

EyeNode is used to represent the user's gaze, and 3D graphics are rendered using the SceneKit framework. Additionally, ARSCNView is used to receive camera input and render AR content.

ARFaceTrackingConfiguration is used to set up ARSession and face tracking, and ARFaceAnchor is used to implement interactions using the user's gaze direction and various parts of their face.

To display the gaze as a cursor image, the eyeGazeHistory array is declared to store gaze positions, and the most recent 70 averageAffineTransforms are averaged to smoothly display the position. Finally, a cursor is created and applied to the center position between the left and right eyes to be applied to the cursor image.

ARDrawingView is based on ARTrackingView and adds CAShapeLayer to draw lines using UIBezierPath, passing eyeGazeHistory.averagePoint to draw lines based on the user's gaze.

Other features include using faceAnchor.blendShapes[.jawOpen] to enable drawing when the mouth or jaw is open, and using frown eyebrows and nose in facial expressions to erase all drawings on the screen. Additionally, when the tongue is extended [.tongueOut] a photo is captured and saved to the album.

Finally, the UIView Extension implements snapshot() to capture the screen and saveScreenshot(), which temporarily pauses the session, calls snapshot(), and uses UIImageWriteToSavedPhotosAlbum to save to the album.

In order to secure memory as much as possible, Deinit removed the remaining images and nodes, and did various tasks such as session pause.

## Who Am I

I am studying iOS development at Apple Developer Academy @POSTECH while I was in my second year of university in Korea.
Currently, I am going through the process of challenging various areas of interest such as UIKit and SwiftUI. I learned a lot about the value of sharing by doing new challenges, and I still share what I learned on github or blog.
I will have a process of sharing what I have learned and learned together, such as sharing and letting others know whenever they need or are curious.
I'd like to continue to share it so that anyone can jump into Apple's ecosystem without being closed.

------

(KR)

## Why I Made 

제가 이 앱을 만든 이유를 꼭 알아주셨으면 합니다.

애플의 "The Greatest" 광고 영상을 보면서, 저는 신체 장애인들이 가지고 있는 따뜻한 감정과 삶의 가치에 영감을 받았습니다. 영상에는 장애인들이 삶에서 다양한 문화 활동을 즐기는 모습과 함께 존경과 따뜻함을 느끼며 함께 시간을 보내는 감동적인 장면이 담겨 있습니다.

하지만, 사실, 신체적인 장애를 가진 사람들은 종종 그들의 생활 방식에서 문화적인 삶에 완전히 몰입하는 데 어려움을 겪습니다. 몸이 불편한 상황에서 친한 사람들도 예술 창작을 즐기지 못하는 것이 아쉬웠습니다. 이를 통해 신체적 장애와 상관없이 누구나 즐길 수 있는 문화 활동을 제공하는 것이 얼마나 중요한지 깨달았습니다.

그래서 저는 이 문제를 해결할 수 있는 방법을 찾아 장애인들이 즐길 수 있는 예술 콘텐츠를 만들었습니다. 그것은 EyeingArt라고 불립니다.

EyeingArt는 사람들이 눈의 움직임과 표정을 사용하여 그림을 그릴 수 있도록 도와주는 앱입니다. EyeingArt를 통해 장애인들은 눈과 표정만으로 그림을 즐길 수 있습니다. 저는 신체적 장애가 있는 사람들이 미술 창작 활동을 더 쉽게 즐길 수 있도록 하고 싶습니다.

사랑하는 사람들과 신체적 장애가 있는 사람들이 EyeingArt를 통해 다양한 그림을 그리는 즐거운 시간을 보냈으면 좋겠습니다. 그리고 제 앱으로 그들의 삶에 긍정적인 영향을 끼치기를 바랍니다.

하지만 앱을 만드는 것만이 아닙니다. 이를 통해 더 따뜻하고 다양하며 포용적인 세상을 만드는 것을 목표로 합니다. 저는 누군가를 돕고 더 나은 세상을 위한 트리거가 될 수 있는 앱을 만들기 위해 계속해서 열심히 노력할 것입니다.

제 앱을 사용하고서 따뜻한 마음이 가득해졌으면 좋겠! 

이 앱은 ARkit의 카메라 권한 사용 때문에 실제 기기에서만 작동합니다.

## Description

이 앱은 눈의 움직임과 표정을 사용하여 그림을 그리는 앱입니다.
나는 장애로 인해서 그림을 그리기 어려운 사람들을 위해 만들었습니다.

이 앱은 대부분 Xcode & 11인치 아이패드 프로에서 실행하는 것이 좋습니다.

시작 화면 및 설명 섹션은 SwiftUI를 사용하여 작성되었습니다.onTapGesture 및 TabView와 같은 기능을 활용했습니다.
EyeTracking을 확인하는 ARTrackingView는 ARKit 및 SceneKit 프레임워크를 사용하여 카메라를 통해 감지된 얼굴의 눈 움직임을 추적하고,  이를 시각화 하는데 사용했습니다.

먼저 EyeTracking의 기능을 보여주기 위해서 시선을 표시하는 EyeNode가 필요했고 SceneKit 프레임워크를 사용하여 3D 그래픽을 렌더링 해주었습니다. 

EyeNode는 사용자의 눈 모델을 나타내며 SCNCylinder 객체를 생성하여 시선의 움직임을 표현해주었습니다. 
또한, SCNNode Extension에 cleanup() 을 추가하여 화면 전환 시 남아있던 Node들을 제거해 주었습니다.

ARSCNView를 사용하여 카메라로부터 입력을 받아 AR 콘텐츠를 렌더링 했습니다.

ARSCNView를 SwiftUI에서 사용하기 위해서 UIViewRepresentable로 wrapping 하여 사용했습니다.

ARFaceTrackingConfiguration을 사용하여 ARSession과 얼굴 추적을 설정하고 ARFaceAnchor를 통해 시선의 방향, 얼굴의 다양한 부분들을 활용하여 interaction들을 구현했습니다.

시선을 Cursor 이미지로 보여주기 위해서 eyeGazeHistory 배열을 선언하여 시선의 위치들을 저장한 후 numberOfSmoothUpdates를 통해 최근 70개의 averageAffineTransform 평균을 구해서 위치를 부드럽게 표현했습니다.

그리고, Cursor를 leftEye와 rightEye의 중간을 centerPoint로 만들어서 Cursor 이미지에 적용해 주었습니다.

마지막으로, UI를 비동기적으로 안전하게 업데이트 하기 위해서 renderer 에서DispatchQueue.main.async를 사용했습니다.

다음으로, 그림을 그리는 ARDrawingView는 ARTrackingView을 기반으로서 부가적인 기능들을 추가했습니다. 

가장 중요한 ARDrawingView의 추가적인 기능으로는 
배경에 CanvasImage를 만들고 CAShapeLayer을 추가해 준 뒤  UIBezierPath를 통해 선을 그릴 수 있도록 해주었습니다.

receiveData(point: CGPoint)에 eyeGazeHistory.averagePoint를 전달해줌으로 써 시선에 따라서 선을 그리도록 구현했습니다.

그 외 기능들로는 faceAnchor.blendShapes[.jawOpen] 을 이용해서 입이 열리거나 턱이 열렸을 때 그림을 그릴 수 있도록 구현 했고,
 faceAnchor.blendShapes에서 눈썹과 코를 이용해서 표정을 찡그리면 그림을 모두 지울 수 있도록 구현했습니다.
또한, (.tongueOut)혀를 내밀면 사진을 캡쳐해서 앨범에 저장하는 기능을 구현했습니다.

UIView Extension에서 화면을 캡쳐하는 snapshot()을 구현하고 
saveScreenshot() 호출 부분에서 session을 잠시 pause한 뒤에 snapshot()을 실행햐고 UIImageWriteToSavedPhotosAlbum
을 통해 앨범에 저장하는 기능을 구현하여 앱을 완성했습니다.

메모리를 최대한 확보하기 위해서 Deinit 부분에서는 남아있는 이미지와 node들을 제거하고, session pause 등 다양한 작업들을 해주었습니다.

Deinit에서는 통해 Node들과 이미지를 제거하며 session을 중지 함으로써 메모리를 최대한 확보합니다.

## Who Am I

저는 한국에서 대학교 2학년을 다니다가 Apple Developer Academy @POSTECH에서 iOS 개발을 공부하는 중 입니다.
현재, 저는 UIKit, SwiftUI 와 같이 여러가지 관심 분야에 대해서 도전해보는 과정을 겪고 있습니다.
새로운 도전들을 해보며 공유라는 가치에 대해서 많이 배우게 되었고 현재도 github 혹은 블로그에 내가 배운 것을 공유하고 있습니다.
제가 배우고 학습한 내용들이 다른 사람들에게도 필요하거나 궁금하다면 언제든지 공유하고 알려주는 등 함께 나누는 과정을 가질 예정입니다.
폐쇄적이지 않고 누구나 Apple 생태계에 뛰어들 수 있도록 앞으로도 공유하고 싶습니다.
