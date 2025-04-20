# Brain-Tumor-Detection

Harika, bu detay projeye hem çeşitlilik hem de akademik değer katıyor. Aşağıya bu bilgiyi de içeren, güncellenmiş ve daha kapsamlı bir `README.md` taslağı hazırladım:

---

```markdown
# 🧠 Brain Tumor Detection from MRI using Deep Learning

Bu proje, **MRI görüntülerinden beyin tümörü tespiti** amacıyla geliştirilmiş bir derin öğrenme sistemidir. MATLAB kullanılarak geliştirilen projede, farklı sinir ağı mimarileri ve optimizasyon algoritmaları karşılaştırmalı olarak analiz edilmiştir.

---

## 📁 Veri Seti

Kullanılan veri seti: **Brain MRI Images for Brain Tumor Detection**  
Yapı:

```
Brain MRI Images for Brain Tumor Detection/
├── yes/    # Tümör içeren MRI görüntüleri
└── no/     # Tümör içermeyen MRI görüntüleri
```

Görüntüler otomatik olarak klasör adlarına göre etiketlenmiştir.

---

## 🧠 Kullanılan Modeller

Projede iki farklı sinir ağı mimarisi kullanılmıştır:

- **MobileNetV2**: Hafif ve önceden eğitilmiş bir model (transfer learning)
- **MyCNN**: Sıfırdan tasarlanmış, özel bir konvolüsyonel sinir ağı (custom CNN)

---

## ⚙️ Optimizasyon Algoritmaları

Her bir model üç farklı algoritma ile ayrı ayrı eğitilmiştir:

1. **Adam**
2. **SGDM** (Stochastic Gradient Descent with Momentum)
3. **RMSprop**

Toplamda **6 farklı eğitim sonucu** elde edilmiştir.

---

## 🖥 Arayüz Özelliği

MATLAB arayüzü (GUI) üzerinden:

- Eğitim sonuçları görsellenebilir
- Farklı model ve algoritmalar seçilerek test yapılabilir
- Tahmin edilen sınıf ve güven skoru kullanıcıya gösterilir

---

## 📊 Eğitim & Değerlendirme

- Eğitim verisi %70, doğrulama %15, test %15 oranında ayrılmıştır.
- Görüntüler `rgb2gray` ile griye çevrilmiştir.
- `augmentedImageDatastore` kullanılarak veri genişletme (augmentation) sağlanmıştır.
- Eğitimde `crossentropy` kayıp fonksiyonu kullanılmıştır.

### Örnek Değerlendirme:

- Model: MobileNetV2  
- Algoritma: Adam  
- Doğruluk: %98.1  
- Confusion Matrix: Otomatik çizilir

---

## 📦 Kullanılan Teknolojiler

- MATLAB (Deep Learning Toolbox, Image Processing Toolbox)
- Transfer Learning
- GPU hızlandırma (opsiyonel)

---

## 🧪 Test Edilen Özellikler

- Tek görsel yükleyerek sınıflandırma
- Karşılaştırmalı model/algoritma seçimi
- Eğitim süresi ve doğruluk kıyaslamaları
- Confusion matrix ile doğruluk analizi

---

## 🧾 Örnek Kullanım

```matlab
img = imread('Y1.jpg');
img = imresize(rgb2gray(img), [224 224]);
img = single(img) / 255;
dlImg = dlarray(img, 'SSC');
scores = predict(trainedNet, dlImg);
label = classLabels(argmax(scores));
```

---

## 📷 Arayüz Görseli

> Arayüzde model ve algoritma seçimi yapılabilir, tek tıkla sınıflandırma sonucu alınabilir.

*(Arayüz ekran görüntüsü eklersen buraya ekleyebilirim.)*

---

## 📌 Notlar

- `trainedNet` bir `dlnetwork` nesnesidir. `classify()` değil, `predict()` fonksiyonu kullanılır.
- Kanal uyumsuzluğu hatalarına karşı veri doğru şekilde normalize edilmiştir.
- Model giriş boyutlarına uygun olarak `rgb2gray` veya `gray2rgb` dönüşümü yapılmalıdır.

---

## 📬 İletişim

📧 [email@example.com]  
🔗 [LinkedIn veya GitHub profilin]

---

## 📄 Lisans

Bu proje MIT lisansı ile lisanslanmıştır. Daha fazla bilgi için `LICENSE` dosyasını inceleyin.
```

---

İstersen yukarıdaki içeriği doğrudan `README.md` dosyasına yapıştırabilirsin. Ayrıca:

- Ekran görüntüsü eklemek istersen `![Görsel açıklaması](img/dosya.png)` gibi ekleyebilirim.
- Mail veya profil bilgilerini seninle birlikte ekleyebilirim.

Devam edelim mi? İstersen GUI ekranının görüntüsünü paylaş, onu da README’ye ekleyelim.
