function CNN_GUI_Working

    % Ana pencere
    fig = uifigure('Name', 'CNN Sınıflandırıcı', 'Position', [500 300 600 400]);

    % Görüntü paneli
    ax = uiaxes(fig, 'Position', [300, 100, 250, 250]);

    % Görüntü seç butonu
    btnSelect = uibutton(fig, 'Text', 'Görüntü Seç', 'Position', [50 300 150 30], ...
        'ButtonPushedFcn', @(btn, event) selectImage());

    % Ağ tipi seçimi (mobilenet ve custom CNN)
    ddModelType = uidropdown(fig, ...
        'Items', {'mobilenetv2', 'myCustomCnn'}, ...
        'Position', [50 260 150 30], ...
        'Value', 'mobilenetv2', ...
        'Tooltip', 'Model türünü seçin');

    % Optimizasyon algoritması seçimi
    ddOptimizer = uidropdown(fig, ...
        'Items', {'adam', 'sgdm', 'rmsprop'}, ...
        'Position', [50 220 150 30], ...
        'Value', 'adam', ...
        'Tooltip', 'Eğitimde kullanılan algoritmayı seçin');

    % Sınıflandır butonu
    btnClassify = uibutton(fig, 'Text', 'Sınıflandır', 'Position', [50 170 150 30], ...
        'ButtonPushedFcn', @(btn, event) classifyImage());

    % Sonuç etiketi
    lblResult = uilabel(fig, 'Text', 'Sınıf: Bekleniyor...', ...
        'Position', [50 120 250 30], 'FontSize', 14);

    % Görüntü yolu saklama
    imagePath = '';

    % Görüntü seçme işlevi
    function selectImage()
        [file, path] = uigetfile({'*.jpg;*.png;*.bmp'}, 'Görüntü Seç');
        if isequal(file, 0)
            return;
        end
        imagePath = fullfile(path, file);
        img = imread(imagePath);
        imshow(img, 'Parent', ax);
        lblResult.Text = 'Sınıf: Bekleniyor...';
    end

    % Sınıflandırma işlevi
    function classifyImage()
        if isempty(imagePath)
            lblResult.Text = 'Lütfen bir görüntü seçin!';
            return;
        end

        % Seçilen optimizer ve model tipine göre dosya adını belirle
        optimizer = ddOptimizer.Value;
        modelType = ddModelType.Value;

        switch modelType
            case 'mobilenetv2'
                modelFile = ['mobilenetv2_' optimizer '.mat'];
            case 'myCustomCnn'
                modelFile = ['myCustomCNN_' optimizer '.mat'];
            otherwise
                lblResult.Text = 'Geçersiz model tipi!';
                return;
        end

        % Modeli yükle
        try
            modelData = load(modelFile);
            net = modelData.trainedNet;
        catch
            lblResult.Text = sprintf('%s modeli yüklenemedi!', modelFile);
            return;
        end
        
        % Görüntüyü hazırla
        img = imread(imagePath);
        inputSize = net.Layers(1).InputSize(1:2);
        img = imresize(img, inputSize);

        % Giriş kanalı sayısına göre gri veya RGB dönüşümü yap
        expectedChannels = net.Layers(1).InputSize(3);

        if expectedChannels == 3 && size(img, 3) == 1
            % Gri -> RGB (örneğin mobilenet)
            img = cat(3, img, img, img);
        elseif expectedChannels == 1 && size(img, 3) == 3
            %RGB -> Gri (örneğin custom CNN)
            img = rgb2gray(img);
        end


        % Gri görüntü ise RGB'ye çevir
        if size(img, 3) == 1 && net.Layers(1).InputSize(3) == 3
            img = cat(3, img, img, img);
        end

        % Sınıflandırma yap
        [label, scores] = classify(net, img);

        % Sonuçları göster
        lblResult.Text = sprintf('Sınıf: %s (%.2f%%)', string(label), max(scores) * 100);
        disp("Tahmin:");
        disp(label);
        disp("Skorlar:");
        disp(scores);
    end
end
